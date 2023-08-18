import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';

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
            subtitle:
                Text('Article: ${article.article}\nPrice: ${article.prix}'),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 90, maxHeight: 40),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Article artic = Article(
                              article: article.article,
                              name: article.name,
                              prix: article.prix,
                              id: article.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddOrUpdateArticle(
                                        isUpdate: true,
                                        article: artic,
                                      )));
                        },
                        icon: const Icon(Icons.mode),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AddordeletorupdateBloc>(context)
                              .add(DelletArticleEvent(articlId: article.id));
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  )),
            ));
      },
    );
  }
}
