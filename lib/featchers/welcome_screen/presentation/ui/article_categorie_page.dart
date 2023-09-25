import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/article_par_categorie_cuibit/article_par_categorie_cubit.dart';

import '../widgets/article_categorie_page_widget.dart/article_par_categorie.dart';

class ArticleCategoriePage extends StatelessWidget {
  const ArticleCategoriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
            constraints: BoxConstraints(maxWidth: 300),
          ),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
            child:
                BlocBuilder<ArticleParCategorieCubit, ArticleParCategorieState>(
                    builder: (context, state) {
              if (state is ArticleParCategorieIsLoadidState) {
                return ArticleParCategorieWidget()
                    .secoundContainer(context, state.articleList);
              }
              return const CerclulareLodingWidget();
            }),
          ),
        )
      ],
    ));
  }
}
