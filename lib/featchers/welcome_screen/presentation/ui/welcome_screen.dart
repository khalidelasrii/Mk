import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/mous_regeon.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int? regeon;
  bool isin1 = false;
  bool isin2 = false;
  bool isin3 = false;
  bool isin4 = false;
  bool isin5 = false;
  bool isin6 = false;
  bool isin7 = true;
  Color whiteColor = Colors.white;
  Color textColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(183, 0, 0, 0),
      // appBar: _buildAppbar(),
      body: _buildbody(),
    );
  }

//! AppBar ///////////
  // AppBar _buildAppbar() {

  // int tiime;
  // Timer.periodic(const Duration(seconds: 1), (_) {
  //   setState(() {
  //     // Get the current time
  //     DateTime now = DateTime.now();

  //     // Extract the seconds part and format it as a string
  //     tiime = now.second;
  //     tiime % 2 == 0
  //         ? (whiteColor = Colors.amber, textColor = Colors.white)
  //         : (whiteColor = Colors.white, textColor = Colors.amber);
  //   });
  // });

  // return AppBar(
  //   backgroundColor: whiteColor,
  //   title: Center(
  //     child: Text(
  //       'Welcom To MiloTech',
  //       style: TextStyle(color: textColor),
  //     ),
  //   ),
  // );
  // }

//! Body ////////////////

  Widget _buildbody() {
    Color conatinercolors = regeon == null ? Colors.transparent : Colors.white;

    Color textIconcolor = regeon == null ? Colors.white : Colors.black;
    List<int> allcatelist = [1, 11, 12, 13, 14, 15, 16, 17, 18];
    List<String> imageSliderUrl = [
      'images/slider/1.jpg',
      'images/slider/2.jpg',
      'images/slider/3.jpg',
      'images/slider/4.jpg',
    ];

    return SingleChildScrollView(
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
                  //! Partie 3 : l'entet qui admet tous les page et les option
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
                                  MousregionAllcategorie().mouseRegion1(false),
                                  MousregionAllcategorie().mouseRegion2(false),
                                  MousregionAllcategorie().mouseRegion3(false),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  MousregionAllcategorie().mouseRegion4(false),
                                  MousregionAllcategorie().mouseRegion5(false),
                                  MousregionAllcategorie().mouseRegion6(false),
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
                                      '           What are you looking for ?',
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
                              isin1 = true;
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
                                    children: [],
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
                ],
              )
            ],
          ),

          //! Welcomme To MiloTech
          Container(
            color: Colors.grey,
            constraints: const BoxConstraints(maxHeight: 100),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RichText(
                      text: const TextSpan(
                          text: 'Welcomme ',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          children: [
                            TextSpan(text: 'to '),
                            TextSpan(
                                text: 'M',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: 'ilo',
                                style: TextStyle(color: Colors.orange)),
                            TextSpan(
                                text: 'Te',
                                style: TextStyle(color: Colors.red)),
                            TextSpan(
                                text: 'ch',
                                style: TextStyle(color: Colors.deepPurple))
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          //! Welcomme To MiloTech
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CarouselSlider.builder(
                  itemCount: imageSliderUrl.length,
                  // les Option:
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                  ),
                  // build Slider
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = imageSliderUrl[index];
                    return Image.asset(
                      urlImage,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              )),

          Container(
            color: Colors.red,
            width: double.infinity,
            height: 30,
          ),
        ],
      ),
    );
  }
}
