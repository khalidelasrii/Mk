import 'package:flutter/material.dart';
import 'package:mk/featchers/posts/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String screenRout = 'Home';
  @override
  Widget build(BuildContext context) {
    List<Article> x = [];
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              ArticlesFirebase articlesFirebase = ArticlesFirebase();
              x = await articlesFirebase.getArticles();
              print("article :$x");
            },
            child: const Icon(Icons.abc),
          ),
        ),
      ),
    );
  }
}
