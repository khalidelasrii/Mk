import 'package:flutter/material.dart';

import '../../../domain/entitie/welcome_article.dart';

class ArticleParCategorieWidget {
  ferstContainer() {
    return SingleChildScrollView(
      child: Column(
        children: [Text('Ferst Container ')],
      ),
    );
  }

  secoundContainer(BuildContext context, List<WelcomeArticle> articleList) {
    return SingleChildScrollView(
        child: ListView.builder(
      itemCount: articleList.length,
      itemBuilder: (context, index) {
        final article = articleList[index];
        return ListTile(
          title: Text(
            article.type,
            style: TextStyle(color: Colors.pink),
          ),
        );
      },
    ));
  }
}
