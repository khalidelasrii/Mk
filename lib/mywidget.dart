import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget myBoton(String text) {
      return TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ));
    }

    return Container(
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(width: 1))),
      child: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ferst part
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Obtenir de l'aide",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                ],
              ),
              // ferst part
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Trade Assurance",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                ],
              ),
              // tert part
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Approvisionnez-vous sur\n MiloTech.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                ],
              ),
              // ford part
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Vendre sur MiloTech.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                ],
              ),
              //  fift part
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Apprenez à nous connaître",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                  myBoton("text"),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [],
        ),
        Row(
          children: [],
        )
      ]),
    );
  }
}
