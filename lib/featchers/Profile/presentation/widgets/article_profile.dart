//! Articles
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../page/profile_screen.dart';
import 'article_profile_child/all_categorie.dart';
import 'article_profile_child/autres.dart';
import 'article_profile_child/cartables.dart';
import 'article_profile_child/forniture.dart';
import 'article_profile_child/livres.dart';
import 'article_profile_child/stylo.dart';

class MesArticlesDeProfile extends StatefulWidget {
  const MesArticlesDeProfile({super.key, required this.user});
  final User? user;

  @override
  State<MesArticlesDeProfile> createState() => _MesArticlesDeProfileState();
}

class _MesArticlesDeProfileState extends State<MesArticlesDeProfile> {
  int currentIndex = 0;
  final List<Widget> pages = [
    AllCategorie(),
    Forniture(),
    Cartables(),
    Livres(),
    Stylo(),
    Autres()
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
          color: mygreen,
          child: Column(
            children: [
              //! botonliste
              BottomNavigationBar(
                backgroundColor: const Color.fromARGB(98, 0, 0, 0),
                selectedItemColor: Colors.amber,
                unselectedItemColor: Colors.white,
                elevation: 0,
                currentIndex: currentIndex,
                onTap: (int newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                items: [
                  const BottomNavigationBarItem(
                    backgroundColor: Color.fromARGB(98, 0, 0, 0),
                    icon: Icon(Icons.category_outlined),
                    label: 'AllCategorie',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: mygreen,
                    icon: const Icon(Icons.calendar_view_week_rounded),
                    label: 'Forniture',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: myblue,
                    icon: const Icon(Icons.wallet_travel_outlined),
                    label: 'Cartables',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: myblue,
                    icon: const Icon(Icons.menu_book),
                    label: 'Livres',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: myblue,
                    icon: const Icon(Icons.ramp_left_sharp),
                    label: 'Stylo',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: myblue,
                    icon: const Icon(Icons.all_inclusive_outlined),
                    label: 'Autres',
                  ),
                ],
              ),
              //! All pages
              pages[currentIndex]
            ],
          )),
    );
  }
}
