import 'package:flutter/material.dart';

import '../../../Authontification/presentation/ui/sing_in.dart';

class AppbarWelcom {
  appbarwelcom(BuildContext context, Color color1, Color color2) {
    return Container(
      color: color1,
      height: 60,
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {},
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
                  color: color1,
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
