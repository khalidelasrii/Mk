import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/recherch_cuibit/recherch_cubit.dart';

import '../../../../core/Widgets/bar_de_recherche.dart';

class ArticleProduit extends StatefulWidget {
  const ArticleProduit({super.key, required this.article});
  final Article article;

  @override
  State<ArticleProduit> createState() => _ArticleProduitState();
}

class _ArticleProduitState extends State<ArticleProduit> {
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
      body: buildbody(context, widget.article, user),
    );
  }
}

buildbody(BuildContext context, Article article, User? user) {
  return StatefulBuilder(builder: ((context, setState) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppbarWelcom().appBarWidget(context, user),
            BardeRocherche().bardeRocherche(context),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: article.articleUrl!,
                          fit: BoxFit.cover,
                          width: 300,
                          height: 300,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            article.article,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            article.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(article.article),
                        ],
                      )
                    ],
                  ),
                ),
                BlocBuilder<RecherchCubit, RecherchState>(
                  builder: (context, state) {
                    if (state is RecherchStartstate) {
                      return BardeRocherche().boxdeRecherche(context);
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }));
}
