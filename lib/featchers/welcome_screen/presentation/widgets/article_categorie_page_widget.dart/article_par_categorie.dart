import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../../../Article/presentation/ui/article_produit.dart';
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
    return ListView.builder(
      itemCount: articleList.length,
      itemBuilder: (context, index) {
        final article = articleList[index];
        return Card(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 200,
                    color: Colors.blue,
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MaterialButton(
                        onPressed: () {
                          final artic = Article(
                              type: article.type,
                              email: article.email,
                              article: article.article,
                              name: article.name,
                              prix: article.prixArticle,
                              id: article.id,
                              articleUrl: article.imageUrl);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ArticleProduit(
                                        article: artic,
                                      )));
                        },
                        child: CachedNetworkImage(
                          imageUrl: article.imageUrl,
                          fit: BoxFit.cover,
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
                          Text(
                            article.article,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            article.email,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              article.prixArticle,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
