//! Articles
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Profile/presentation/bloc/get_Mes_article/get_mes_article_cubit.dart';
import '../../../Authontification/domain/entitie/user.dart';
import '../../domaine/entitie/profile_articles.dart';
import '../page/profile_screen.dart';
import 'article_profile_child/all_categorie.dart';

class MesArticlesDeProfile extends StatefulWidget {
  const MesArticlesDeProfile({super.key, required this.user});
  final Usr user;

  @override
  State<MesArticlesDeProfile> createState() => _MesArticlesDeProfileState();
}

class _MesArticlesDeProfileState extends State<MesArticlesDeProfile> {
  int currentIndex = 0;

  final List<String> pages = [
    "AllCategorie",
    "Forniture",
    "Cartables",
    "Livres",
    "Stylo",
    "Autres"
  ];

  @override
  Widget build(BuildContext context) {
    //! apelle des articles par categorie
    BlocProvider.of<GetMesArticleCubit>(context).getMesArticleEvent(
      ProfleArticle(
          article: '',
          articleId: '',
          email: widget.user.email!,
          name: '',
          prix: '',
          articleType: pages[currentIndex],
          uid: widget.user.uid!),
    );
    // apelle des articles par categorie
    return Expanded(
      child: Container(
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
              onTap: (value) {
                setState(() {
                  currentIndex = value;
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
            const AllCategorie(),
          ],
        ),
      ),
    );
  }
}
