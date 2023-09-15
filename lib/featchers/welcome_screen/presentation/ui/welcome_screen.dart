import 'package:flutter/material.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int? regeon;
  bool isin = false;
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
                                  // MousregionAllcategorie()
                                  //     .mouseRegion(false, 1),
                                  // MousregionAllcategorie()
                                  //     .mouseRegion(false, 2),
                                  // MousregionAllcategorie()
                                  //     .mouseRegion(false, 3),
                                  // const SizedBox(
                                  //   width: 150,
                                  // ),
                                  // MousregionAllcategorie()
                                  //     .mouseRegion(false, 4),
                                  // MousregionAllcategorie()
                                  //     .mouseRegion(false, 5),
                                  // MousregionAllcategorie()
                                  //     .mouseRegion(false, 6),
                                ]),
                          ),
                        ]),
                  ),
                  //

                  //! ///////// la bare  de recherche
                  if (regeon == null)

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
