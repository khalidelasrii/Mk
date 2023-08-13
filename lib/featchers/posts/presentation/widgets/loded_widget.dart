import 'package:flutter/material.dart';

import '../../domain/entitie/article.dart';

class LodedWidget extends StatelessWidget {
  const LodedWidget({super.key, required this.articles});
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          title: Text(article.name),
          subtitle: Text('Article: ${article.article}\nPrice: ${article.prix}'),
        );
      },
    );
  }
}
