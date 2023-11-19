import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Profile/presentation/page/profile_screen.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/presentation/messages_ui/messages_page.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/appbafont_cuibit/appbafont_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';

import '../../featchers/Authontification/presentation/ui/sing_in.dart';
import '../../featchers/messaget_futchers/presentation/bloc/descusion_cubit/descusion_cubit.dart';
import '../../featchers/messaget_futchers/presentation/bloc/message_cubit/messages_cubit.dart';
import '../../featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

class AppbarWelcom {
  User? userVer;

  appBarWidget(BuildContext context, User? userVer) {
    return StatefulBuilder(
      builder: (context, setState) {
        return BlocBuilder<ToolbarCubit, ToolbarState>(
          builder: (context, state) {
            if (state is ToolbarInitial) {
              return appbarwelcom(
                  context, Colors.transparent, Colors.white, userVer);
            } else if (state is CategorieState1 ||
                state is CategorieState2 ||
                state is CategorieState3 ||
                state is CategorieState4 ||
                state is CategorieState5 ||
                state is CategorieState6) {
              return appbarwelcom(context,
                  const Color.fromARGB(70, 49, 128, 52), Colors.amber, userVer);
            }
            return appbarwelcom(
                context, Colors.transparent, Colors.white, userVer);
          },
        );
      },
    );
  }

  appbarwelcom(BuildContext context, Color color1, Color color2, User? user) {
    TextEditingController textEditingController = TextEditingController();
    String? textsearch;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: color1,
        height: 60,
        child: Row(
          children: [
            textsearch == null
                ? Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          BlocProvider.of<MessagesCubit>(context)
                              .initialEvent();
                          BlocProvider.of<DescusionCubit>(context)
                              .getDescusionEvent();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const WelcomeScreen()));
                        },
                        child: Row(
                          children: [
                            Image.asset('images/MK.png'),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'M',
                                      style: TextStyle(
                                          color: color2, fontSize: 30)),
                                  TextSpan(
                                      text: 'iloTech',
                                      style: TextStyle(
                                          color: color2, fontSize: 20))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              textsearch = '';
                            });
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ))
                    ],
                  )

                //! bar de recherche

                : Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchBar(
                          controller: textEditingController,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 10.0)),
                          onTap: () {
                            setState(() {
                              textsearch = "";
                            });
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              textsearch = value;
                            });
                          },
                          leading: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.search)),
                          trailing: <Widget>[
                            textsearch == ""
                                ? SizedBox()
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        textsearch = "";
                                      });
                                      textEditingController.clear();
                                    },
                                    icon: const Icon(Icons.clear),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
            const Expanded(child: SizedBox()),
            user != null
                ? MaterialButton(
                    onPressed: () {
                      BlocProvider.of<MessagesCubit>(context).initialEvent();
                      BlocProvider.of<DescusionCubit>(context)
                          .getDescusionEvent();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MessagesUi()));
                    },
                    child: SizedBox(
                        child: BlocBuilder<DescusionCubit, DescusionState>(
                      builder: (context, state) {
                        if (state is LodidDescusionState) {
                          return StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                              stream: state.descusions,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  int cont = 0;
                                  List<Messages> x =
                                      snapshot.data!.docs.map((subdata) {
                                    final subEmail = subdata.data();
                                    return Messages(
                                        message: '', nbrvu: subEmail["nbr"]);
                                  }).toList();
                                  for (Messages i in x) {
                                    cont = i.nbrvu + cont;
                                  }
                                  return Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      const Icon(
                                        Icons.message,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            cont.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  );
                                }
                              });
                        } else {
                          return const Icon(
                            Icons.message,
                            color: Colors.white,
                          );
                        }
                      },
                    )),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                focusColor: Colors.orange,
                hoverColor: Colors.red,
                onPressed: () {
                  BlocProvider.of<MessagesCubit>(context).initialEvent();
                  BlocProvider.of<DescusionCubit>(context).getDescusionEvent();
                  BlocProvider.of<AppbafontCubit>(context)
                      .appBarfontPressedEvent();
                },
                icon: Icon(
                  Icons.shopping_basket,
                  color: color2,
                ),
              ),
            ),
            user != null
                ? MaterialButton(
                    focusColor: Colors.orange,
                    hoverColor: Colors.red,
                    onPressed: () {
                      BlocProvider.of<MessagesCubit>(context).initialEvent();
                      BlocProvider.of<DescusionCubit>(context)
                          .getDescusionEvent();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProfileScreen(
                                    user: user,
                                  )));
                    },
                    child: user.photoURL != null
                        ? ClipOval(
                            child: Image.network(
                              user.photoURL!,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(Icons.person, color: color2),
                  )
                : MaterialButton(
                    hoverColor: Colors.red,
                    focusColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SingIn()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: color2,
                        ),
                        Text(
                          'Connexion',
                          style: TextStyle(
                            color: color2,
                          ),
                        )
                      ],
                    ))
          ],
        ),
      );
    });
  }
}
