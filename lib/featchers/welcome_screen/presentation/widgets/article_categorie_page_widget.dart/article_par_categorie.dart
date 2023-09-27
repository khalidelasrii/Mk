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
        return Card(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    child: MaterialButton(
                      onPressed: () {
                        final artic = Article(
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
                          Text(
                            articleList[index].article,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(articleList[index].type),
                          Text(
                            articleList[index].email,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              articleList[index].prixArticle,
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
