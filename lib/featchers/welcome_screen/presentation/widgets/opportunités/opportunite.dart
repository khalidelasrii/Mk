import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Opportunite extends StatelessWidget {
  const Opportunite({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconsWidgets = [
      "images/slider/homme.jpg",
      "images/slider/jolie.jpg",
      "images/slider/u.jpg",
    ];

    return Container(
      height: 600,
      width: double.infinity,
      color: Colors.grey[200],
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Découvrez vos prochaines opportunités commerciales:",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 90),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Meilleur classement",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("voir plus"))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 400,
                            color: Colors.amber,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: iconsWidgets.map((name) {
                                return Image.asset(
                                  name,
                                  fit: BoxFit.cover,
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Nouveautés",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("voir plus"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Bonnes affaires",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("voir plus"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
