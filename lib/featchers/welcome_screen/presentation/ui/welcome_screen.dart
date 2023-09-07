import 'package:flutter/material.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(183, 0, 0, 0),
      appBar: _buildAppbar(),
      body: _buildbody(),
    );
  }
}

AppBar _buildAppbar() {
  return AppBar();
}

Widget _buildbody() {
  Color textIconcolor = Colors.white;
  Color conatinercolors = Colors.transparent;
  int? regeon;
  return StatefulBuilder(builder: (context, setState) {
//! la prtie 3 ///////////////////////////////////
    MouseRegion mouseRegion(int rrr, letext) {
      return MouseRegion(
        onEnter: (event) {
          setState(() {
            conatinercolors = Colors.white;
            textIconcolor = Colors.black;
            regeon = rrr;
          });
        },
        onExit: (event) {
          setState(() {
            conatinercolors = Colors.transparent;
            textIconcolor = Colors.white;
            regeon = null;
          });
        },
        child: MaterialButton(
          hoverColor: const Color.fromARGB(122, 255, 193, 7),
          color: conatinercolors,
          elevation: 0,
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.list,
                color: textIconcolor,
              ),
              Text(
                letext,
                style: TextStyle(color: textIconcolor),
              )
            ],
          ),
        ),
      );
    }

//! ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    return Stack(
      children: [
        SizedBox(
          height: 500,
          width: double.infinity,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              'images/bck.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            //! Partie 2 de l Appbar
            Container(
              color: conatinercolors,
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
                                  style: TextStyle(
                                      color: textIconcolor, fontSize: 30)),
                              TextSpan(
                                  text: 'iloTech',
                                  style: TextStyle(
                                      color: textIconcolor, fontSize: 20))
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
                          color: textIconcolor,
                        )),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SingIn()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: textIconcolor,
                        ),
                        Text(
                          'Sing in',
                          style: TextStyle(
                            color: textIconcolor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //! Partie 3 de l Appbar
            Container(
              color: conatinercolors,
              height: 60,
              child: Row(children: [
                mouseRegion(1, 'All Categorie'),
                mouseRegion(2, 'Featured selections'),
                mouseRegion(3, 'Trade Assurance'),
                const Expanded(child: SizedBox()),
                mouseRegion(4, 'Buyer Central'),
                mouseRegion(5, 'Become a supplier'),
                mouseRegion(6, 'Get the app'),
                mouseRegion(7, 'Help Center'),
              ]),
            ),
            //! //////// LA partie de catégorie
            if (regeon == 1)
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    regeon = 1;
                  });
                },
                onExit: (_) {
                  setState(() {
                    regeon = null;
                  });
                },
                child: Container(
                  height: 600,
                  color: Colors.white38,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text('Hello word'),
                              Text('Hello word'),
                              Text('Hello word'),
                              Text('Hello word'),
                              Text('Hello word'),
                              Text('Hello word'),
                              Text('Hello word'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.red,
                      )),
                      Expanded(
                          child: Container(
                        color: Colors.amber,
                      )),
                    ],
                  ),
                ),
              )
            //! //// la partie de
          ],
        )
      ],
    );
  });
}
