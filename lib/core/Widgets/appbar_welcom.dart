import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/presentation/messages_ui/messages_page.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';

import '../../featchers/Article/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import '../../featchers/Authontification/presentation/ui/sing_in.dart';
import '../../featchers/messaget_futchers/presentation/bloc/descusion_cubit/descusion_cubit.dart';
import '../../featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

class AppbarWelcome extends StatefulWidget {
  const AppbarWelcome({super.key});

  @override
  State<AppbarWelcome> createState() => _AppbarWelcomeState();
}

class _AppbarWelcomeState extends State<AppbarWelcome> {
  User? user;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? usr) {
        if (usr != null) {
          setState(() {
            user = usr;
          });
          BlocProvider.of<DescusionCubit>(context).getDescusionEvent();
          BlocProvider.of<DrawerDataCubit>(context).shoppingDataDrawerEvent();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is ToolbarInitial) {
          return appbarwelcom(context, Colors.transparent, Colors.white, user,
              textEditingController);
        } else if (state is CategorieState1 ||
            state is CategorieState2 ||
            state is CategorieState3 ||
            state is CategorieState4 ||
            state is CategorieState5 ||
            state is CategorieState6) {
          return appbarwelcom(context, const Color.fromARGB(70, 49, 128, 52),
              Colors.amber, user, textEditingController);
        }
        return appbarwelcom(context, Colors.transparent, Colors.white, user,
            textEditingController);
      },
    );
  }

  appbarwelcom(BuildContext context, Color color1, Color color2, User? user,
      TextEditingController textEditingController) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: color1,
        constraints:
            const BoxConstraints(minHeight: 60, maxWidth: double.infinity),
        child: Row(
          children: [
            //! logo
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WelcomeScreen()));
              },
              child: SizedBox(
                child: Row(
                  children: [
                    Image.asset(
                      'images/MK.png',
                      height: 60,
                      width: 60,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'M',
                              style: TextStyle(color: color2, fontSize: 30)),
                          TextSpan(
                              text: 'iloTech',
                              style: TextStyle(color: color2, fontSize: 20))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const Expanded(child: SizedBox()),
            //! Serch Button
            IconButton(
                onPressed: () {
                  BlocProvider.of<DrawerDataCubit>(context).searchDrawerEvent();
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            //! Messages Icons
            user != null
                ? MaterialButton(
                    onPressed: () {
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
                                      cont != 0
                                          ? ClipOval(
                                              child: Container(
                                                color: Colors.red,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    cont.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
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

            //! Shop Icon
            user != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      focusColor: Colors.orange,
                      hoverColor: Colors.red,
                      onPressed: () {
                        BlocProvider.of<DrawerDataCubit>(context)
                            .shopingPageEvent();
                      },
                      icon: BlocBuilder<DrawerDataCubit, DrawerDataState>(
                        builder: (context, state) {
                          if (state is ShoppingDataState) {
                            return StreamBuilder<
                                QuerySnapshot<Map<String, dynamic>>>(
                              stream: state.articles,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final articl = snapshot.data!.size;

                                  return Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Icon(
                                        Icons.shopping_basket,
                                        color: color2,
                                      ),
                                      articl != 0
                                          ? ClipOval(
                                              child: Container(
                                                color: const Color.fromARGB(
                                                    131, 244, 67, 54),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    articl.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  );
                                } else {
                                  return Icon(
                                    Icons.shopping_basket,
                                    color: color2,
                                  );
                                }
                              },
                            );
                          } else {
                            return Icon(
                              Icons.shopping_basket,
                              color: color2,
                            );
                          }
                        },
                      ),
                    ),
                  )
                : const SizedBox(),
            //! Connection Bottun
            SizedBox(
              child: user != null
                  ? MaterialButton(
                      focusColor: Colors.orange,
                      hoverColor: Colors.red,
                      onPressed: () {
                        BlocProvider.of<DrawerDataCubit>(context)
                            .profileDrawerEvent();
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
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
