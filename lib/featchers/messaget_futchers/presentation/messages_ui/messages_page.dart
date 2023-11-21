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
    // Écouter les changements dans l'état de l'authentification Firebase
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
            // Barre d'applications
            AppbarWelcom().appBarWidget(context, user),
            // Core des messages
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
  TextEditingController duscusTextEditingController = TextEditingController();
  TextEditingController messagetextEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    duscusTextEditingController.dispose();
    messagetextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(maxWidth: double.infinity, maxHeight: 600),
      child: Row(
        children: [
          // Partie gauche : Négociations
          Expanded(
            child: Container(
              child: descusionCorefonction(
                  context, widget.user, duscusTextEditingController),
            ),
          ),
          // Partie droite : Messages
          Expanded(
            flex: 2,
            child: Container(
              child: messageTo == null
                  ? Center(
                      child: SizedBox(child: Image.asset('images/MK.png')),
                    )
                  : messageCorefonction(
                      context, widget.user, messagetextEditingController),
            ),
          ),
        ],
      ),
    );
  }

  // Fonctionnalité principale des négociations
  descusionCorefonction(BuildContext context, User? user,
      TextEditingController textEditingController) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Zone pour ajouter une nouvelle négociation
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
                    });
                    BlocProvider.of<MessagesCubit>(context)
                        .getMessagesEvent(messageTo!);
                  },
                  child: const Text(
                    'Go',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Liste des négociations
          SizedBox(
            height: 600,
            child: BlocBuilder<DescusionCubit, DescusionState>(
              builder: (context, state) {
                if (state is LodidDescusionState) {
                  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: state.descusions,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Messages> descusionList =
                            snapshot.data!.docs.map((subdoc) {
                          final subdocemail = subdoc.data();
                          return Messages(
                              message: '',
                              emailSender: subdocemail["email"],
                              nbrvu: subdocemail['nbr'] ?? 100);
                        }).toList();

                        return ListView.builder(
                          itemCount: descusionList.length,
                          itemBuilder: (context, index) {
                            final descusion = descusionList[index];

                            return MaterialButton(
                              onPressed: () {
                                BlocProvider.of<MessagesCubit>(context)
                                    .getMessagesEvent(descusion.emailSender!);

                                setState(() {
                                  messageTo = descusion.emailSender;
                                });
                              },
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${descusion.nbrvu}"),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      descusion.emailSender!,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text('is data stream');
                      }
                    },
                  );
                } else {
                  return const Text('is state');
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // Fonctionnalité principale des messages
  messageCorefonction(BuildContext context, User? user,
      TextEditingController textEditingController) {
    String message = "";

    // Fonction pour mettre à jour le nombre de messages vus
    contour(BuildContext context, String mess, List<Messages> meslest) {
      int x = 0;
      for (Messages i in meslest) {
        i.vu == false && user!.email == i.emailSender ? x = x + 1 : null;
      }
      BlocProvider.of<DescusionCubit>(context).nbrMessageVu(mess, x);
    }

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
            ),
          ),
        ),
        // Liste des messages
        Expanded(
          child: SizedBox(
            child: BlocBuilder<MessagesCubit, MessagesState>(
              builder: (context, state) {
                if (state is LodidMessagesState) {
                  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: state.messages,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Messages> messagesList =
                            snapshot.data!.docs.map((subDoc) {
                          final subDocMessage = subDoc.data();
                          return Messages(
                            nbrvu: 0,
                            message: subDocMessage['message'],
                            emailRecuper: subDocMessage['emailRecuper'],
                            emailSender: subDocMessage['emailSender'],
                            vu: subDocMessage['vu'],
                            messageId: subDoc.id,
                            dateTime: subDocMessage["dateTime"],
                            descusionId: subDocMessage["descusionId"],
                          );
                        }).toList();
                        contour(context, messageTo!, messagesList);
                        return ListView.builder(
                          reverse: true,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            final item = messagesList[index];

                            if (user!.email == item.emailRecuper!) {
                              if (item.vu == false) {
                                BlocProvider.of<MessagesCubit>(context)
                                    .messageVuEvent(Messages(
                                  nbrvu: 0,
                                  descusionId: item.descusionId,
                                  message: item.message,
                                  dateTime: item.dateTime,
                                  messageId: item.messageId,
                                  vu: true,
                                  emailSender: item.emailSender,
                                  emailRecuper: item.emailRecuper,
                                ));
                                BlocProvider.of<DescusionCubit>(context)
                                    .nbrMessageVu(messageTo!, 0);
                              }

                              return Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 60,
                                        bottom: 4,
                                        top: 4,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 156, 144, 144),
                                                  Colors.blueGrey
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8,
                                                top: 8,
                                                bottom: 14,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.emailSender!,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    item.message,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 4),
                                              Text(
                                                "${item.dateTime!.toDate().hour.toString()}:${item.dateTime!.toDate().minute.toString()} ",
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              );
                            } else {
                              return Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                        left: 60,
                                        bottom: 4,
                                        top: 4,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 46, 128, 49),
                                                  Color.fromARGB(
                                                      255, 8, 104, 37),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8,
                                                bottom: 14,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    item.emailSender!,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    item.message,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              item.vu == false
                                                  ? const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 12,
                                                    )
                                                  : const Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.green,
                                                      size: 12,
                                                    ),
                                              Text(
                                                "${item.dateTime!.toDate().hour.toString()}:${item.dateTime!.toDate().minute.toString()} ",
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
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
                  BlocProvider.of<MessagesCubit>(context).sendMessageEvent(
                      Messages(
                          nbrvu: 0,
                          message: message,
                          emailRecuper: messageTo,
                          vu: false));
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
