import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

class ArticleProduit extends StatelessWidget {
  const ArticleProduit({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildbody(context, article),
    );
  }
}

buildbody(BuildContext context, Article article) {
  return StatefulBuilder(builder: ((context, setState) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 70),
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 700),
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Container(
                    color: Colors.white38,
                    width: double.infinity,
                    constraints: BoxConstraints(maxHeight: 50),
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 1000),
                      color: Colors.amber,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 1000),
                              color: Colors.pink,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                              color: Colors.amber,
                                              constraints: const BoxConstraints(
                                                  maxHeight: 300),
                                              child: CachedNetworkImage(
                                                imageUrl: article.articleUrl!,
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.low,
                                              )),
                                          Text(article.article),
                                          Text(article.email),
                                          Text(article.prix),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 1000),
                              color: Colors.purple,
                              child: Column(children: [Text('Hello World')]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }));
}