import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../ui/article_produit.dart';
import '../../../domain/entitie/welcome_article.dart';

class ArticleParCategorieWidget {
  ferstContainer() {
    return const SingleChildScrollView(
      child: Column(
        children: [Text('Ferst Container ')],
      ),
    );
  }

  secoundContainer(BuildContext context, List<WelcomeArticle> articleList) {
    String isHover = '';
    void navToarticlepage(int index) {
      final artic = Article(
          userId: articleList[index].userId,
          type: articleList[index].type,
          email: articleList[index].email,
          article: articleList[index].article,
          name: articleList[index].name,
          prix: articleList[index].prixArticle,
          id: articleList[index].id,
          articleUrl: articleList[index].imageUrl);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ArticleProduit(
                    article: artic,
                  )));
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            return MouseRegion(
              onEnter: (_) {
                setState(() {
                  isHover = articleList[index].id;
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
                      color: isHover == articleList[index].id
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
                              navToarticlepage(index);
                            },
                            child: Card(
                              child: CachedNetworkImage(
                                imageUrl: articleList[index].imageUrl,
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
                                    navToarticlepage(index);
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
                                  articleList[index].type,
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
                                    articleList[index].prixArticle,
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
      },
    );
  }
}
