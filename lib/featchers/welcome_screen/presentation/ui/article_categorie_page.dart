import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/const_widget/my_colors.dart';
import '../../../../core/Widgets/appbar_welcom.dart';
import '../widgets/article_categorie_page_widget.dart/article_par_categorie.dart';

class ArticleCategoriePage extends StatefulWidget {
  const ArticleCategoriePage({super.key});

  @override
  State<ArticleCategoriePage> createState() => _ArticleCategoriePageState();
}

class _ArticleCategoriePageState extends State<ArticleCategoriePage> {
  User? user;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? userr) {
        if (userr != null) {
          setState(() {
            user = userr;
          });
        }
      },
    );
    return Scaffold(
      backgroundColor: mybluebackgroundcolor,
      body: Column(
        children: [
          const AppbarWelcome(),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 250,
                      color: mybluebackgroundcolor,
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: SizedBox(child: ArticleParCategorieWidget()),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
