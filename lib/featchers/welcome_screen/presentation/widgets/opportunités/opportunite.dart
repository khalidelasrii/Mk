import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Opportunite extends StatelessWidget {
  const Opportunite({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconsWidgets = ["homme", "jolie", "u"];
    return Container(
      width: double.infinity,
      height: 600,
      color: Colors.grey[200],
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 30000, maxHeight: 600),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: 400,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayCurve: Curves.easeOutQuint,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                              aspectRatio: 9 / 16,
                            ),
                            items: iconsWidgets.map((name) {
                              return Image.asset(
                                "images/slider/$name.jpg",
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                              );
                            }).toList(),
                          ),
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
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        constraints:
                            const BoxConstraints(maxHeight: 400, maxWidth: 400),
                        child: GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/welcome/${index + 1}.jpg",
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "images/welcome/1.jpg",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.low,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  "Nouveautés de la semaine",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(" voir plus")),
                            ],
                          ),
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
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        constraints:
                            const BoxConstraints(maxHeight: 250, maxWidth: 400),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/welcome/2.jpg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "Les prix les plus bas en 180 jours",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 400,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            const SizedBox(
                              child: Text(
                                "Offres sur les Meilleurs ventes",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/welcome/1.jpg",
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
