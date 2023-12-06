import 'package:flutter/material.dart';

class CaleteWidgets extends StatefulWidget {
  const CaleteWidgets({super.key});

  @override
  State<CaleteWidgets> createState() => _CaleteWidgetsState();
}

class _CaleteWidgetsState extends State<CaleteWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 94, 57, 8),
      width: double.infinity,
      height: 400,
      child: const Center(
        child: SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoxCalete(
                    icon: Icons.category,
                    text1: "Des millions d’offres commerciales",
                    text2:
                        "Découvrez des produits et des fournisseurs pour votre entreprise parmi des millions d'offres dans le monde entier.",
                  ),
                  BoxCalete(
                    icon: Icons.security,
                    text1: "Qualité et transactions assurées",
                    text2:
                        "Assurez la qualité de la production auprès de fournisseurs vérifiés, avec vos commandes protégées du paiement à la livraison.",
                  ),
                  BoxCalete(
                    icon: Icons.crop_rotate_sharp,
                    text1: "Une solution commerciale à guichet unique",
                    text2:
                        "Commander en toute transparence, de la recherche de produits/fournisseurs à la gestion des commandes, au paiement et à l'exécution.",
                  ),
                  BoxCalete(
                    icon: Icons.document_scanner_rounded,
                    text1: "Expérience de trading personnalisée",
                    text2:
                        "Bénéficiez d'avantages soigneusement sélectionnés, tels que des échantillons à prix réduit et une assistance dédiée, adaptés au stade de croissance de votre entreprise.",
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class BoxCalete extends StatefulWidget {
  const BoxCalete(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2});
  final String text1;
  final String text2;
  final IconData icon;
  @override
  State<BoxCalete> createState() => _BoxCaleteState();
}

class _BoxCaleteState extends State<BoxCalete> {
  bool isin = false;
  Color recolor = const Color.fromARGB(103, 82, 9, 4);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: MaterialButton(
        onPressed: () {},
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 250,
                height: 350,
                decoration: BoxDecoration(
                  color: isin == false ? recolor : Colors.green,
                  border: Border.all(
                      color: isin == false ? Colors.transparent : Colors.amber),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: widget.text1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "\n\n${widget.text2}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 30),
                child: Icon(
                  widget.icon,
                  color: isin == false ? Colors.amber : Colors.red,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
