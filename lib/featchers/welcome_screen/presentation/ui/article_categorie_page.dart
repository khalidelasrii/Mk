import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/article_par_categorie_cuibit/article_par_categorie_cubit.dart';

import '../widgets/article_categorie_page_widget.dart/article_par_categorie.dart';
import 'package:mk/injection_container.dart' as di;

class ArticleCategoriePage extends StatelessWidget {
  const ArticleCategoriePage({super.key, required this.collection});
  final String collection;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ArticleParCategorieCubit>()
        ..getarticleParCategorieEvent(collection),
      child: Row(
        children: [
          Container(
            color: Colors.amber,
            constraints: const BoxConstraints(maxWidth: 200),
            child: ArticleParCategorieWidget().ferstContainer(),
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 2000),
              child: BlocBuilder<ArticleParCategorieCubit,
                  ArticleParCategorieState>(builder: (context, state) {
                if (state is ArticleParCategorieIsLoadidState) {
                  return ArticleParCategorieWidget()
                      .secoundContainer(context, state.articleList);
                }
                return const CerclulareLodingWidget();
              }),
            ),
          )
        ],
      ),
    );
  }
}
