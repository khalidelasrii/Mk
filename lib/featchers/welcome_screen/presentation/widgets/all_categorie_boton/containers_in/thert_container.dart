import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/adoor_articles_cuibit/adoor_articles_cubit.dart';

import '../../../../domain/entitie/welcome_article.dart';

thertContainer() {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      color: Colors.orange,
      height: double.infinity,
      child: BlocConsumer<AdoorArticlesCubit, AdoorArticlesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LodidAdorArticlesState) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                WelcomeArticle article = state.articles[index];

                return Text(article.email);
              },
            );
          }
          return const CerclulareLodingWidget();
        },
      ),
    ),
  );
}
