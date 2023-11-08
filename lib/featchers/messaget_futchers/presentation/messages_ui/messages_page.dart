import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/presentation/bloc/descusion_cubit/descusion_cubit.dart';

import '../bloc/message_cubit/messages_cubit.dart';

class MessagesUi extends StatefulWidget {
  const MessagesUi({super.key});

  @override
  State<MessagesUi> createState() => _MessagesUiState();
}

class _MessagesUiState extends State<MessagesUi> {
  User? user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? usr) {
      if (usr != null) {
        setState(() {
          user = usr;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mybluebackgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWelcom().appBarWidget(context, user),
            MessageCore(user: user),
          ],
        ),
      ),
    );
  }
}

class MessageCore extends StatefulWidget {
  const MessageCore({super.key, required this.user});
  final User? user;
  @override
  State<MessageCore> createState() => _MessageCoreState();
}

class _MessageCoreState extends State<MessageCore> {
  String? messageTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(maxWidth: double.infinity, maxHeight: 600),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: descusionCorefonction(context),
          )),
          Expanded(
              flex: 4,
              child: Container(
                child: messageTo == null
                    ? Center(
                        child: SizedBox(child: Image.asset('images/MK.png')),
                      )
                    : messageCorefonction(context, widget.user),
              )),
        ],
      ),
    );
  }

//! le core de duscusion
  descusionCorefonction(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: [
          //     //! La zone pour ajouter une nouvelle descusion
          Container(
            constraints: const BoxConstraints(
              minHeight: 50,
              maxHeight: 60,
              maxWidth: double.infinity,
            ),
            decoration: const BoxDecoration(color: Colors.blue),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                    onChanged: (value) {
                      messageTo = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: 'email@adreess.com',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                MaterialButton(
                  hoverColor: Colors.white,
                  onPressed: () {
                    textEditingController.clear();
                    setState(() {
                      messageTo;
                      BlocProvider.of<MessagesCubit>(context)
                          .getMessagesEvent(messageTo!);
                    });
                  },
                  child: const Text(
                    'Go',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          //     //! La list de descusion
          SizedBox(
            height: 600,
            child: BlocBuilder<DescusionCubit, DescusionState>(
              builder: (context, state) {
                if (state is LodidDescusionState) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: state.descusions,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!.docs;
                          List<String> descusionList = [];
                          for (var descusion in data) {
                            descusionList.add(descusion["email"]);
                          }
                          //!

                          return ListView.builder(
                            itemCount: descusionList.length,
                            itemBuilder: (context, index) {
                              final descusion = descusionList[index];

                              return MaterialButton(
                                onPressed: () {
                                  BlocProvider.of<MessagesCubit>(context)
                                      .getMessagesEvent(descusion);

                                  setState(() {
                                    messageTo = descusion;
                                  });
                                },
                                child: ListTile(
                                    title: Text(
                                  descusion,
                                  style: const TextStyle(color: Colors.white),
                                )),
                              );
                            },
                          );
                        } else {
                          return Text('is data stream');
                        }
                      });
                } else {
                  return Text('is state');
                }
              },
            ),
          )
        ],
      ),
    );
  }

  //! Le core de messages

  messageCorefonction(BuildContext context, User? user) {
    TextEditingController textEditingController = TextEditingController();
    String message = "";
    return Column(
      children: [
        Container(
          color: Colors.blue,
          width: double.infinity,
          height: 50,
          child: Center(
              child: Text(
            messageTo!,
            style: const TextStyle(color: Colors.white),
          )),
        ),
        //! La liste de message
        Expanded(
          child: SizedBox(
            child: BlocBuilder<MessagesCubit, MessagesState>(
              builder: (context, state) {
                if (state is LodidMessagesState) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: state.messages,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!.docs;
                        List<Map<String, String>> messagesList = [];

                        for (var messag in data) {
                          messagesList.add({
                            "message": messag["message"],
                            "emailSender": messag["emailSender"],
                            "emailRecuper": messag["emailRecuper"],
                            "descusionId": messag["descusionId"],
                          });
                        }

                        return ListView.builder(
                          reverse: true,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            final item = messagesList[index];
                            return user!.email == item["emailRecuper"]!
                                ? Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 60,
                                                bottom: 4,
                                                top: 4),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 156, 144, 144),
                                                        Colors.blueGrey
                                                      ],
                                                      begin: Alignment
                                                          .topCenter,
                                                      end: Alignment
                                                          .bottomCenter),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item["emailSender"]!,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      item["message"]!,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                      const Expanded(child: SizedBox())
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Expanded(child: SizedBox()),
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 60,
                                              bottom: 4,
                                              top: 4),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color.fromARGB(
                                                          255, 46, 128, 49),
                                                      Color.fromARGB(
                                                          255, 8, 104, 37)
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    item["emailSender"]!,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255,
                                                            190,
                                                            164,
                                                            164)),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    item["message"]!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        );
                      } else {
                        return const CerclulareLodingWidget();
                      }
                    },
                  );
                } else {
                  return const CerclulareLodingWidget();
                }
              },
            ),
          ),
        ),

        //! La zone pour ecriire un nouvaux message
        Container(
          constraints: const BoxConstraints(
            minHeight: 50,
            maxHeight: 60,
            maxWidth: double.infinity,
          ),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.orange])),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: textEditingController,
                  onChanged: (value) {
                    message = value;
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
                  BlocProvider.of<MessagesCubit>(context)
                      .sendMessageEvent(Messages(
                    message: message,
                    emailRecuper: messageTo,
                  ));
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
    );
  }
}
