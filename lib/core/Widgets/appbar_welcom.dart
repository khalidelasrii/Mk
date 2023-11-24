import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Profile/presentation/page/profile_screen.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/presentation/messages_ui/messages_page.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';

import '../../featchers/Authontification/presentation/ui/sing_in.dart';
import '../../featchers/messaget_futchers/presentation/bloc/descusion_cubit/descusion_cubit.dart';
import '../../featchers/messaget_futchers/presentation/bloc/message_cubit/messages_cubit.dart';
import '../../featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

class AppbarWelcome extends StatefulWidget {
  const AppbarWelcome({super.key, required this.user});
  final User? user;

  @override
  State<AppbarWelcome> createState() => _AppbarWelcomeState();
}

class _AppbarWelcomeState extends State<AppbarWelcome> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<DescusionCubit>(context).getDescusionEvent();
    BlocProvider.of<MessagesCubit>(context).initialEvent();
  }

  TextEditingController textEditingController = TextEditingController();

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
          return appbarwelcom(context, Colors.transparent, Colors.white,
              widget.user, textEditingController);
        } else if (state is CategorieState1 ||
            state is CategorieState2 ||
            state is CategorieState3 ||
            state is CategorieState4 ||
            state is CategorieState5 ||
            state is CategorieState6) {
          return appbarwelcom(context, const Color.fromARGB(70, 49, 128, 52),
              Colors.amber, widget.user, textEditingController);
        }
        return appbarwelcom(context, Colors.transparent, Colors.white,
            widget.user, textEditingController);
      },
    );
  }

  appbarwelcom(BuildContext context, Color color1, Color color2, User? user,
      TextEditingController textEditingController) {
    String? textsearch;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: color1,
        constraints:
            const BoxConstraints(minHeight: 60, maxWidth: double.infinity),
        child: Row(
          children: [
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 2000),
                child: textsearch == null
                    ? Container(
                        constraints: const BoxConstraints(
                            maxHeight: 60, maxWidth: double.infinity),
                        child: Row(
                          children: [
                            //! logo
                            MaterialButton(
                              onPressed: () {
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
                            const Expanded(child: SizedBox()),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    textsearch = '';
                                  });
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      )
                    : Container(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Row(
                          children: [
                            //! bar de recherche
                            Expanded(
                              flex: 2,
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SearchBar(
                                      controller: textEditingController,
                                      padding: const MaterialStatePropertyAll<
                                              EdgeInsets>(
                                          EdgeInsets.symmetric(
                                              horizontal: 10.0)),
                                      onTap: () {
                                        setState(() {
                                          textsearch = "";
                                        });
                                      },
                                      onChanged: (value) {
                                        value == ""
                                            ? BlocProvider.of<
                                                        WelcomeArticleBlocBloc>(
                                                    context)
                                                .add(WelcomeBlocInitialEvent())
                                            : BlocProvider.of<
                                                        WelcomeArticleBlocBloc>(
                                                    context)
                                                .add(RecherchStatEvent(
                                                    value: value));

                                        setState(() {
                                          textsearch = value;
                                        });
                                      },
                                      leading: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.search)),
                                      trailing: <Widget>[
                                        textsearch == ""
                                            ? const SizedBox()
                                            : IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              WelcomeArticleBlocBloc>(
                                                          context)
                                                      .add(
                                                          WelcomeBlocInitialEvent());
                                                  setState(() {
                                                    textsearch = null;
                                                  });
                                                  textEditingController.clear();
                                                },
                                                icon: const Icon(Icons.clear),
                                              ),
                                      ],
                                    )),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
              ),
            ),
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

            //! Shop Icon
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                focusColor: Colors.orange,
                hoverColor: Colors.red,
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: color2,
                ),
              ),
            ),
            SizedBox(
              child: user != null
                  ? MaterialButton(
                      focusColor: Colors.orange,
                      hoverColor: Colors.red,
                      onPressed: () {
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
