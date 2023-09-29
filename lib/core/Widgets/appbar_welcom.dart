import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/appbafont_cuibit/appbafont_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';

import '../../featchers/Authontification/presentation/ui/sing_in.dart';
import '../../featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

class AppbarWelcom {
  final _auth = FirebaseAuth.instance;
  Usr? userVer;
  bool isConect = false;

  appBarWidget(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        _auth.authStateChanges().listen(
          (User? user) {
            if (user != null) {
              setState(() {
                isConect = true;

                userVer = Usr(
                  email: user.email!,
                  password: '',
                  profile: user.photoURL,
                  name: user.displayName,
                );
              });
            } else {
              setState(() {
                isConect = false;
              });
            }
          },
        );
        return BlocBuilder<ToolbarCubit, ToolbarState>(
          builder: (context, state) {
            if (state is ToolbarInitial) {
              return appbarwelcom(
                  context, Colors.transparent, Colors.white, isConect, userVer);
            } else if (state is CategorieState1 ||
                state is CategorieState2 ||
                state is CategorieState3 ||
                state is CategorieState4 ||
                state is CategorieState5 ||
                state is CategorieState6) {
              return appbarwelcom(
                  context,
                  const Color.fromARGB(70, 49, 128, 52),
                  Colors.amber,
                  isConect,
                  userVer);
            }
            return appbarwelcom(
                context, Colors.transparent, Colors.white, isConect, userVer);
          },
        );
      },
    );
  }

  appbarwelcom(BuildContext context, Color color1, Color color2, bool isHover,
      Usr? user) {
    return Container(
      color: color1,
      height: 60,
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const WelcomeScreen()));
            },
            child: Row(
              children: [
                Image.asset('images/MK.png'),
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
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
                focusColor: Colors.orange,
                hoverColor: Colors.red,
                onPressed: () {
                  BlocProvider.of<AppbafontCubit>(context)
                      .appBarfontPressedEvent();
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: color2,
                )),
          ),
          isHover
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    focusColor: Colors.orange,
                    hoverColor: Colors.red,
                    onPressed: () {},
                    icon: Icon(Icons.person, color: color2),
                  ),
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
                  ),
                )
        ],
      ),
    );
  }
}
