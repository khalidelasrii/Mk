import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_articles.dart';

import '../../../../../core/Widgets/core_widgets.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';

class AllCategorie extends StatelessWidget {
  const AllCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is LodedArticleState) {
          return StreamBuilder<QuerySnapshot<Map>>(
            stream: state.articles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<ProfleArticle> mesArticle =
                    snapshot.data!.docs.map((subdata) {
                  final sub = subdata.data();
                  return ProfleArticle(
                      articleUrl: sub['articleUrl'],
                      userId: sub['userId'],
                      type: sub['type'],
                      email: sub['email'],
                      article: sub['article'],
                      name: sub['name'],
                      prix: sub['prix'],
                      id: sub['id']);
                }).toList();

                return ListView.builder(
                  itemCount: mesArticle.length,
                  itemBuilder: (context, index) {
                    return Text('hello');
                  },
                );
              } else {
                return const CerclulareLodingWidget();
              }
            },
          );
        }
        return const Center(child: CerclulareLodingWidget());
      },
    );
  }
}
