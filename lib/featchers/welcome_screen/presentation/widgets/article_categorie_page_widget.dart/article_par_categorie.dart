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
        return Container(
            color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  constraints:
                      const BoxConstraints(maxHeight: 150, maxWidth: 150),
                  child: CachedNetworkImage(
                    imageUrl: article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ))
              ],
            ));
      },
    );
  }
}
