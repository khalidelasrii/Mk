import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 100,
                color: Colors.grey,
                constraints: const BoxConstraints(maxWidth: 600),
                // child: CachedNetworkImage(imageUrl: article.imageUrl),
              ),
            )),
            Expanded(
              flex: 3,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.article,
                    ),
                    Text(
                      article.email,
                    ),
                    Text(
                      article.prixArticle,
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Icon(Icons.shopping_cart),
                  )
                ],
              ),
            ))
          ],
        ));
      },
    );
  }
}
