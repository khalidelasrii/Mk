import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PersonnalisezVotre extends StatelessWidget {
  const PersonnalisezVotre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.pink[100],
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              "Personnalisez votre expérience de trading avec des avantages soigneusement\n sélectionnés",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          color: Colors.pink[100],
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              " Développez et réussissez avec les avantages soigneusement sélectionnés, proposés par Alibaba.com, que vous soyez une entreprise en démarrage ayant besoin de l’essentiel pour commencer à s’approvisionner ou une entreprise bien établie à la recherche d’outils et de services pour des commandes plus complexes.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
                autoPlay: true,
                height: 350),
            items: [1, 2, 3, 4, 5, 6].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(248, 187, 208, 1),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/welcomeslid/$i.jpg",
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 104, 49, 1),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                const Text(
                  "Prêt à commencer ?",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Découvrez des millions de produits auprès de fournisseurs de confiance en vous inscrivant dès aujourd’hui !",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  const Color.fromRGBO(245, 124, 0, 1))),
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          " Sedientifier ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            // ignore: prefer_const_constructors
            child: Column(
              children: [
                Text(
                  "Autonomiser les entreprises grâce au\n commerce mondial",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Alibaba.com propose des solutions de trading B2B à guichet unique pour les petites et moyennes entreprises mondiales, leur permettant de se transformer grâce au commerce numérique, de saisir des opportunités et d'accélérer leur croissance à l'échelle internationale.",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 800,
                  width: 500,
                  color: Colors.amber,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 50),
                    child: Container(
                      height: 400,
                      width: 500,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Container(
                      height: 300,
                      width: 500,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
