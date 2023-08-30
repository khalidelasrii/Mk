import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';

import '../../../Authontification/domain/entitie/user.dart';
import '../../domain/entitie/article.dart';

class GridViewBody extends StatelessWidget {
  const GridViewBody(
      {super.key,
      required this.articles,
      required this.user,
      required this.isDisktop});
  final List<Article> articles;
  final Usr user;
  final bool isDisktop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: GridView.builder(
          itemCount: articles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDisktop == true ? 5 : 3),
          itemBuilder: (context, index) {
            final article = articles[index];
            return GridTile(
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    color: Colors.red,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: Text(user.email),
                            ),
                            DropdownButton<String>(
                              icon: const Icon(Icons.more_horiz),
                              elevation: 0,
                              dropdownColor:
                                  const Color.fromARGB(101, 77, 61, 61),
                              iconEnabledColor: Colors.white,
                              items: const [
                                DropdownMenuItem(
                                  value: '1',
                                  child: Center(
                                    child: Icon(
                                      Icons.handyman,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '2',
                                  child: Center(
                                      child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )),
                                ),
                              ],
                              onChanged: (newValue) {
                                if (newValue == '1') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AddOrUpdateArticle(
                                                user: user,
                                                isUpdate: true,
                                                article: article,
                                              )));
                                } else if (newValue == '2') {
                                  BlocProvider.of<AddordeletorupdateBloc>(
                                          context)
                                      .add(DelletArticleEvent(
                                          articlId: article.id));
                                  BlocProvider.of<ArticleBloc>(context)
                                      .add(GetAllArticlesEvent());
                                }
                              },
                            ),
                          ],
                        ),
                        Text(article.article),
                        Text(article.name),
                      ]),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
