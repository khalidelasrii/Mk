import 'package:flutter/material.dart';

class DeffinitionWidgets extends StatelessWidget {
  const DeffinitionWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      constraints: const BoxConstraints(maxWidth: 50000),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Découvrez des millions\n d’offres  adaptées aux \n besoins de votre...",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 90,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                  child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(69, 158, 158, 158)))),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Plus de ',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '200 ',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: ' millions',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '\n produits',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(69, 158, 158, 158)))),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: '5 900',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '\n catégories de produits',
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 200,
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(69, 158, 158, 158)))),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Plus de\n ',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '200 000 ',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '\n fournisseurs',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 200,
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(69, 158, 158, 158)))),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Plus de\n ',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '100+ ',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '\n Rrégions',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
