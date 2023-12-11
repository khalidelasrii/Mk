import 'package:flutter/material.dart';
import 'package:mk/core/const_widget/my_flutter_app_icons.dart';

class InfoAboutNous extends StatelessWidget {
  const InfoAboutNous({super.key});

  @override
  Widget build(BuildContext context) {
    Widget headButton(String text) {
      return TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ));
    }

    Widget bodyButton(String text) {
      return TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ));
    }

    Widget socialButton(IconData icon, String lien) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: () {}, icon: Icon(icon)),
      );
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
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headButton("Obtenir de l'aide"),
                    bodyButton("Centre d'assistance"),
                    bodyButton("Discussion en direct"),
                    bodyButton("Vérifiez l'état de la commande"),
                    bodyButton("Remboursements"),
                    bodyButton("Report abuse"),
                  ],
                ),
              ),
              // ferst part
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headButton("Trade Assurance"),
                    bodyButton("Paiements sûrs et faciles"),
                    bodyButton("Politique de remboursement"),
                    bodyButton("Une expédition à temps"),
                    bodyButton("Protections après-vente"),
                    bodyButton("Services de suivi des produits"),
                  ],
                ),
              ),
              // tert part
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headButton("Approvisionnez-vous sur\n MiloTech.com"),
                  bodyButton("Demande de devis"),
                  bodyButton("Programme d’adhésion "),
                  bodyButton("Alibaba.com Logistics"),
                  bodyButton("Taxe de vente et TVA"),
                  bodyButton("Alibaba.com Informations"),
                ],
              ),
              // ford part
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headButton("Vendre sur MiloTech.com"),
                    bodyButton("Commencer à vendre"),
                    bodyButton("Vendeur Central"),
                    bodyButton("Devenir un fournisseur vérifié"),
                    bodyButton("Partenariats"),
                    bodyButton(
                        "Téléchargez l'application pour les fournisseurs"),
                  ],
                ),
              ),
              //  fift part
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headButton("Apprenez à nous connaître"),
                    bodyButton("À propos d'Alibaba.com"),
                    bodyButton("Responsabilité des entreprises"),
                    bodyButton("Centre d'informations"),
                    bodyButton("Carrières"),
                  ],
                ),
              ),
            ],
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                child: Row(
                  children: [
                    socialButton(MyFlutterApp.facebook, ""),
                    socialButton(MyFlutterApp.instagram, ""),
                    socialButton(MyFlutterApp.twitter, ""),
                    socialButton(MyFlutterApp.youtube, ""),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Row(
                  children: [
                    const Text("Vendez en déplacement avec "),
                    TextButton(
                        onPressed: () {},
                        child: const Text("l'application Alibaba.com"))
                  ],
                ),
              ),
            ),
          ],
        ),

        // Row(
        //   children: [],
        // )
      ]),
    );
  }
}
