import 'package:flutter/material.dart';

class RationalisezCommande extends StatefulWidget {
  const RationalisezCommande({super.key});

  @override
  State<RationalisezCommande> createState() => _RationalisezCommandeState();
}

class _RationalisezCommandeState extends State<RationalisezCommande> {
  int numb = 1;
  bool one = false;
  bool two = false;
  bool tree = false;
  bool foor = false;
  bool five = false;

  Widget myBottonWidget(
      String text, String secontext, int wherIs, bool trueorfalse) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          numb = wherIs;
          if (numb == 1) {
            one = true;
          } else if (numb == 2) {
            two = true;
          } else if (numb == 3) {
            tree = true;
          } else if (numb == 4) {
            foor = true;
          } else if (numb == 5) {
            five = true;
          }
        });
      },
      onExit: (_) {
        setState(() {
          if (numb == 1) {
            one = false;
          } else if (numb == 2) {
            two = false;
          } else if (numb == 3) {
            tree = false;
          } else if (numb == 4) {
            foor = false;
          } else if (numb == 5) {
            five = false;
          }
        });
      },
      child: SizedBox(
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FloatingActionButton(
                    backgroundColor:
                        trueorfalse == false ? Colors.indigo : Colors.amber,
                    onPressed: () {},
                    child: Icon(
                      Icons.abc,
                      size: trueorfalse == false ? 30 : 50,
                      color: trueorfalse == false ? Colors.blue : Colors.red,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 400,
                      child: Text(
                        text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: trueorfalse == false ? 30 : 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trueorfalse == true
                        ? SizedBox(
                            width: 400,
                            child: Text(
                              secontext,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: SizedBox(
              width: 700,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myBottonWidget(
                        'Recherchez des offres ',
                        "Recherchez et filtrez parmi des millions d’offres de produits et de fournisseurs pour trouver ceux qui correspondent à votre entreprise",
                        1,
                        one),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          one = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          one = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Align(
                          alignment: Alignment
                              .centerLeft, // Adjust the alignment of the line
                          child: Container(
                            width: 2,
                            height: one == true || two == true ? 50 : 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    myBottonWidget(
                        'identifiez le bon fournisseur  ',
                        "Évaluez la qualité des produits et les capacités des fournisseurs facilement et efficacement grâce à des inspections vérifiées et à des outils d’approvisionnement numérique.",
                        2,
                        two),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          two = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          two = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Align(
                          alignment: Alignment
                              .centerLeft, // Adjust the alignment of the line
                          child: Container(
                            width: 2,
                            height: tree == true || two == true ? 50 : 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    myBottonWidget(
                        'payez en toute sécurité ',
                        "Payez votre commande dans plus de 20 devises par le biais de plus de 20 méthodes de paiement multiples et sécurisées, y compris des conditions de paiement flexibles.",
                        3,
                        tree),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          tree = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          tree = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Align(
                          alignment: Alignment
                              .centerLeft, // Adjust the alignment of the line
                          child: Container(
                            width: 2,
                            height: tree == true || foor == true ? 50 : 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    myBottonWidget(
                        'procédez en toute sérénité ',
                        "Répondez à vos besoins logistiques grâce au suivi en temps réel de plus de 26 000 itinéraires dans 220 pays et régions, assuré par Logistique Alibaba.com.",
                        4,
                        foor),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          foor = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          foor = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Align(
                          alignment: Alignment
                              .centerLeft, // Adjust the alignment of the line
                          child: Container(
                            width: 2,
                            height: five == true || foor == true ? 50 : 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    myBottonWidget(
                        'procédez en toute sérénité ',
                        "Répondez à vos besoins logistiques grâce au suivi en temps réel de plus de 26 000 itinéraires dans 220 pays et régions, assuré par Logistique Alibaba.com.",
                        5,
                        five),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              "images/welcome/$numb.jpg",
              height: 400,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
