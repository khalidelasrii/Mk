import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../../domain/entitie/article.dart';
import '../../../welcome_screen/presentation/ui/article_produit.dart';

class GridViewBody extends StatefulWidget {
  const GridViewBody({super.key, required this.user});
  final User? user;

  @override
  State<GridViewBody> createState() => _GridViewBodyState();
}

class _GridViewBodyState extends State<GridViewBody> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is LodedAllarticlesState) {
          return StreamBuilder<QuerySnapshot<Map>>(
            stream: state.articles,
            builder: (context, snapshot) {
              // print(snapshot.data!.size);
              if (snapshot.hasData) {
                final List<Article> allArticle =
                    snapshot.data!.docs.map((subdata) {
                  final sub = subdata.data();

                  return Article(
                    uid: sub['uid'],
                    articleType: sub['articleType'],
                    email: sub['email'],
                    article: sub['article'],
                    name: sub['name'],
                    prix: sub['prix'],
                    articleUrl: sub['articleUrl'],
                    articleId: subdata.id,
                    likers: sub["likers"],
                  );
                }).toList();

                return Container(
                  constraints: const BoxConstraints(maxHeight: 1000),
                  child: GridView.builder(
                    itemCount: allArticle.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6),
                    itemBuilder: (context, index) {
                      final article = allArticle[index];
                      String? userLike = article.likers!.firstWhere(
                          (element) => element == widget.user!.uid,
                          orElse: () => "true");
                      return GridTile(
                        footer: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(article.email),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (userLike != "true") {
                                        article.likers!
                                            .remove(widget.user!.uid);
                                        BlocProvider.of<AddordeletorupdateBloc>(
                                                context)
                                            .add(AddLikeEvent(
                                                article: Article(
                                          uid: article.uid,
                                          articleType: article.articleType,
                                          email: article.email,
                                          article: article.article,
                                          name: article.name,
                                          prix: article.prix,
                                          articleId: article.articleId,
                                          articleUrl: article.articleUrl,
                                          likers: article.likers,
                                          date: article.date,
                                        )));
                                      } else {
                                        article.likers!.add(widget.user!.uid);
                                        BlocProvider.of<AddordeletorupdateBloc>(
                                                context)
                                            .add(AddLikeEvent(
                                                article: Article(
                                          uid: article.uid,
                                          articleType: article.articleType,
                                          email: article.email,
                                          article: article.article,
                                          name: article.name,
                                          prix: article.prix,
                                          articleId: article.articleId,
                                          articleUrl: article.articleUrl,
                                          likers: article.likers,
                                        )));
                                      }
                                    },
                                    icon: Icon(
                                      Icons.handshake,
                                      color: userLike == "true"
                                          ? Colors.white
                                          : Colors.red,
                                    )),
                                Text(
                                  "${(article.likers!.length - 1)}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        header: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: SizedBox(child: Text(article.name)),
                            ),
                            DropdownButton<String>(
                              underline: const SizedBox(),
                              isDense: true,
                              icon: const Icon(Icons.more_vert_outlined),
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
                                                isUpdate: true,
                                                article: article,
                                                user: widget.user,
                                              )));
                                } else if (newValue == '2') {
                                  BlocProvider.of<AddordeletorupdateBloc>(
                                          context)
                                      .add(DelletArticleEvent(
                                          articlId: article.articleId,
                                          collectionId: article.articleType));
                                  BlocProvider.of<ArticleBloc>(context)
                                      .add(GetAllArticlesEvent());
                                }
                              },
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            hoverColor: Colors.amber,
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
                            child: CachedNetworkImage(
                              imageUrl: article.articleUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const CerclulareLodingWidget();
              }
            },
          );
        } else {
          return const CerclulareLodingWidget();
        }
      },
    );
  }
}
