import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';

import '../../../Authontification/domain/entitie/user.dart';
import '../../domain/entitie/article.dart';
import '../ui/article_produit.dart';

class GridViewBody extends StatefulWidget {
  const GridViewBody(
      {super.key,
      required this.articles,
      required this.user,
      required this.isDisktop});
  final List<Article> articles;
  final Usr user;
  final bool isDisktop;

  @override
  State<GridViewBody> createState() => _GridViewBodyState();
}

class _GridViewBodyState extends State<GridViewBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: GridView.builder(
          itemCount: widget.articles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.isDisktop == true ? 4 : 3),
          itemBuilder: (context, index) {
            final article = widget.articles[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GridTile(
                  footer: SizedBox(child: Text(article.email)),
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton<String>(
                        underline: const SizedBox(),
                        isDense: true,
                        icon: const Icon(Icons.more_horiz),
                        elevation: 0,
                        dropdownColor: const Color.fromARGB(101, 77, 61, 61),
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
                                          user: widget.user,
                                          isUpdate: true,
                                          article: article,
                                        )));
                          } else if (newValue == '2') {
                            BlocProvider.of<AddordeletorupdateBloc>(context)
                                .add(DelletArticleEvent(
                                    articlId: article.id,
                                    collectionId: article.email));
                            BlocProvider.of<ArticleBloc>(context)
                                .add(GetAllArticlesEvent());
                          }
                        },
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 30),
                      child: MaterialButton(
                        onPressed: () {
                          BlocProvider.of<ArticleBloc>(context)
                              .add(AddoorlableArticlesEvent(article));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ArticleProduit(
                                        article: article,
                                      )));
                        },
                        child: Image.network(
                          article.articleUrl!,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
