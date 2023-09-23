import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/adoor_articles_cuibit/adoor_articles_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/article_categorie_page.dart';

thertContainer() {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      height: double.infinity,
      child: BlocConsumer<AdoorArticlesCubit, AdoorArticlesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LodidAdorArticlesState) {
            return GridView.builder(
              itemCount: state.articles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SizedBox(
                    child: GridTile(
                      header: Text(article.type),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ArticleCategoriePage(
                                        collection: article.type,
                                      )));
                        },
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: article.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const CerclulareLodingWidget();
        },
      ),
    ),
  );
}
