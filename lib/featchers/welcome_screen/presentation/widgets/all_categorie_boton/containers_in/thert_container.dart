import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/article_categorie_page.dart';

thertContainer() {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      height: double.infinity,
      child: BlocConsumer<WelcomeArticleBlocBloc, WelcomeArticleBlocState>(
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
                      header: Text(article.articleType),
                      child: MaterialButton(
                        onPressed: () {
                          BlocProvider.of<WelcomeArticleBlocBloc>(context).add(
                              GetarticleParCategorieEvent(
                                  collection: article.articleType));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const ArticleCategoriePage()));
                        },
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: article.articleUrl!,
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
