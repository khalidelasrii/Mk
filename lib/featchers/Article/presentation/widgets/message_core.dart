import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../../data/models/message.dart';
import '../bloc/message_cuibite/messag_cubit.dart';

class MessageCoreWidget extends StatefulWidget {
  const MessageCoreWidget({super.key, required this.messageTo});
  final String messageTo;
  @override
  State<MessageCoreWidget> createState() => _MessageCoreWidgetState();
}

class _MessageCoreWidgetState extends State<MessageCoreWidget> {
  Color mygreen = const Color.fromARGB(115, 76, 175, 79);
  Color myteal = const Color.fromARGB(129, 0, 150, 135);
  Color myblue = const Color.fromARGB(121, 33, 149, 243);
  Color profilcolor = const Color.fromARGB(84, 0, 0, 0);
  TextEditingController textEditingController = TextEditingController();
  Message messagevalue = Message(message: '', recupererEmail: '');

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MessagCubit>(context).getMessagesEvent(widget.messageTo);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 500),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: myteal,
                child: BlocBuilder<MessagCubit, MessagState>(
                  builder: (context, state) {
                    if (state is LodidMessagesState) {
                      return StreamBuilder<QuerySnapshot>(
                        stream: state.messages,
                        builder: (context, snapshot) {
                          final List<Map<String, String>> mess = [];
                          if (snapshot.hasData) {
                            final messages = snapshot.data!.docs;
                            for (var message in messages) {
                              mess.add({
                                "message": message['message'],
                                "senderEmail": message['senderEmail'],
                              });
                            }
                            return ListView.builder(
                              itemCount: mess.length,
                              itemBuilder: (context, index) {
                                final messageMap = mess[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, right: 150, bottom: 8),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 9, 76, 109),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              bottomRight:
                                                  Radius.circular(25))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              messageMap['senderEmail']!,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                            Text(
                                              messageMap['message']!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              },
                            );
                          } else {
                            return const CerclulareLodingWidget();
                          }
                        },
                      );
                    }
                    return const CerclulareLodingWidget();
                  },
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 50, maxHeight: 60),
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.blue, Colors.orange])),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onChanged: (value) {
                        setState(() {
                          messagevalue = Message(
                              message: value, recupererEmail: widget.messageTo);
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Écrire un message....',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  MaterialButton(
                    hoverColor: Colors.red,
                    onPressed: () {
                      textEditingController.clear();
                      BlocProvider.of<MessagCubit>(context)
                          .sendMessageEvent(messagevalue);
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
