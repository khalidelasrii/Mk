import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';

import '../../../../../core/Widgets/core_widgets.dart';
import '../../ui/article_produit.dart';

class ArticleParCategorieWidget extends StatefulWidget {
  const ArticleParCategorieWidget({super.key});

  @override
  State<ArticleParCategorieWidget> createState() =>
      _ArticleParCategorieWidgetState();
}

class _ArticleParCategorieWidgetState extends State<ArticleParCategorieWidget> {
  @override
  Widget build(BuildContext context) {
    String isHover = '';

    return BlocBuilder<WelcomeArticleBlocBloc, WelcomeArticleBlocState>(
        builder: (context, state) {
      if (state is ArticleParCategorieIsLoadidState) {
        final List<WelcomeArticle> articleList = state.articleList;
        return ListView.builder(
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            return MouseRegion(
              onEnter: (_) {
                setState(() {
                  isHover = articleList[index].articleId;
                });
              },
              onExit: (_) {
                setState(() {
                  isHover = '';
                });
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(
                      color: isHover == articleList[index].articleId
                          ? Colors.blue
                          : Colors
                              .transparent, // Changer la couleur de la bordure en survol
                      width: 2.0, // Largeur de la bordure
                    ),
                  ),
                  color: Colors.transparent,
                  elevation: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ArticleProduit(
                                            article: Article(
                                                uid: articleList[index].uid,
                                                articleType: articleList[index]
                                                    .articleType,
                                                email: articleList[index].email,
                                                article:
                                                    articleList[index].article,
                                                name: articleList[index].name,
                                                prix: articleList[index].prix,
                                                articleId: articleList[index]
                                                    .articleId,
                                                articleUrl: articleList[index]
                                                    .articleUrl),
                                          )));
                            },
                            child: Card(
                              child: CachedNetworkImage(
                                imageUrl: articleList[index].articleUrl!,
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 1500),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ArticleProduit(
                                                  article: Article(
                                                      uid: articleList[index]
                                                          .uid,
                                                      articleType:
                                                          articleList[index]
                                                              .articleType,
                                                      email: articleList[index]
                                                          .email,
                                                      article:
                                                          articleList[index]
                                                              .article,
                                                      name: articleList[index]
                                                          .name,
                                                      prix: articleList[index]
                                                          .prix,
                                                      articleId:
                                                          articleList[index]
                                                              .articleId,
                                                      articleUrl:
                                                          articleList[index]
                                                              .articleUrl),
                                                )));
                                  },
                                  child: Text(
                                    articleList[index].article,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  articleList[index].articleType,
                                  style: const TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                                Text(
                                  articleList[index].email,
                                  style: const TextStyle(
                                    color: Colors.white10,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    articleList[index].prix,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: MaterialButton(
                                      color: Colors.green,
                                      focusColor: Colors.white,
                                      hoverColor: Colors.red,
                                      onPressed: () {},
                                      child: Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 200),
                                        child: const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Acheter maintenant',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      } else {
        return const CerclulareLodingWidget();
      }
    });
  }
}
