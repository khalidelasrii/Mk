import 'package:flutter/material.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int? regeon = null;
  bool isin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(183, 0, 0, 0),
      appBar: _buildAppbar(),
      body: _buildbody(),
    );
  }

//! AppBar ///////////
  AppBar _buildAppbar() {
    return AppBar();
  }

//! Body ////////////////

  Widget _buildbody() {
    Color conatinercolors = regeon == null ? Colors.transparent : Colors.white;

    Color textIconcolor = regeon == null ? Colors.white : Colors.black;
    List<int> allcatelist = [1, 11, 12, 13, 14, 15, 16, 17, 18];

    MouseRegion mouseRegion(int rrr, letext, bool isin) {
      return MouseRegion(
        onEnter: (_) {
          setState(() {
            conatinercolors = Colors.white;
            textIconcolor = Colors.black;
            regeon = rrr;
            isin = true;
          });
        },
        onExit: (_) {
          setState(() {
            isin = false;
            conatinercolors = Colors.transparent;
            textIconcolor = Colors.white;
            regeon = null;
          });
        },
        child: MaterialButton(
          hoverColor: isin ? Colors.amber : conatinercolors,
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

    return SingleChildScrollView(
      //! la prtie 3 ///////////////////////////////////

      //! ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.black,
                height: 500,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.3,
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
                                            color: textIconcolor,
                                            fontSize: 30)),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SingIn()));
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
                    width: double.infinity,
                    height: 60,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  mouseRegion(1, 'All Categorie', isin),
                                  mouseRegion(2, 'Featured selections', isin),
                                  mouseRegion(3, 'Trade Assurance', isin),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  mouseRegion(4, 'Buyer Central', isin),
                                  mouseRegion(5, 'Become a supplier', isin),
                                  mouseRegion(6, 'Get the app', isin),
                                  mouseRegion(7, 'Help Center', isin),
                                ]),
                          ),
                        ]),
                  ),
                  //

                  //! ///////// la bare  de recherche
                  if (regeon == null)
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Container(
                              constraints: const BoxConstraints(maxWidth: 900),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText:
                                      '           What are you looking for?',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                onChanged: (value) {
                                  // Gérer les modifications du texte de recherche ici
                                },
                              )),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.lightBlue])),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  //! //////// LA partie de catégorie
                  for (int x in allcatelist)
                    if (regeon == x)
                      MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              regeon = 1;
                              isin = true;
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      mouseRegion(11, 'All categorie', isin),
                                      mouseRegion(12, 'All categorie', isin),
                                      mouseRegion(13, 'All categorie', isin),
                                      mouseRegion(14, 'All categorie', isin),
                                      mouseRegion(15, 'All categorie', isin),
                                      mouseRegion(16, 'All categorie', isin),
                                      mouseRegion(17, 'All categorie', isin),
                                      mouseRegion(18, 'All categorie', isin),
                                    ],
                                  ),
                                ),
                                if (regeon == 11 || regeon == 1)
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 233,
                                          height: 339,
                                          color: Colors.amber,
                                        ),
                                        Container(
                                          width: 233,
                                          height: 339,
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ))
                  //! //// la partie de
                ],
              )
            ],
          ),
          Container(
            height: 150,
            color: Colors.grey,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: const TextSpan(
                        text: 'Welcomme ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: 'to '),
                          TextSpan(
                              text: 'M', style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: 'ilo', style: TextStyle(color: Colors.red)),
                          TextSpan(
                              text: 'Tech',
                              style: TextStyle(color: Colors.green))
                        ]),
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
