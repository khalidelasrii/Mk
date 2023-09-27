import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';

import '../../../Authontification/presentation/ui/sing_in.dart';
import '../bloc/toolbar_Cuibit/toolbar_cubit.dart';

class AppbarWelcom {
  appBarWidget() {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is AppbarfesrtState) {
          return appbarwelcom(context, state.color1, state.color2);
        } else if (state is CategorieState1 ||
            state is CategorieState2 ||
            state is CategorieState3 ||
            state is CategorieState4 ||
            state is CategorieState5 ||
            state is CategorieState6) {
          return appbarwelcom(context, Color(0x464CAF4F), Colors.amber);
        }
        return appbarwelcom(context, Colors.transparent, Colors.white);
      },
    );
  }

  appbarwelcom(BuildContext context, Color color1, Color color2) {
    return Container(
      color: color1,
      height: 60,
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
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
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: color2,
                )),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const SingIn()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: color2,
                ),
                Text(
                  'Sing in',
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
