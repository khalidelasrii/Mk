import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';

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
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is LodedAllarticlesState) {
          return StreamBuilder<QuerySnapshot<Map>>(
            stream: state.articles,
            builder: (context, snapshot) {
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
                    date: sub["date"],
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
                      final user = widget.user != null ? widget.user!.uid : "";

                      return GridTile(
                        footer: ListTile(
                            subtitle: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<DrawerDataCubit>(context)
                                      .addArticleInWaleteEvent(WelcomeArticle(
                                    uid: article.uid,
                                    articleType: article.articleType,
                                    email: article.email,
                                    article: article.article,
                                    name: article.name,
                                    prix: article.prix,
                                    articleId: article.articleId,
                                    date: article.date,
                                    articleUrl: article.articleUrl,
                                    likers: article.likers,
                                  ));
                                },
                                child: const Text("Acheter Now")),
                            title: Text(article.article),
                            trailing: Text(article.prix)),
                        header: user != article.uid
                            ? const SizedBox()
                            : ListTile(
                                title: Text(article.email),
                                trailing: DropdownButton<String>(
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
                                              builder: (_) =>
                                                  AddOrUpdateArticle(
                                                    isUpdate: true,
                                                    article: article,
                                                    user: widget.user,
                                                  )));
                                    } else if (newValue == '2') {
                                      BlocProvider.of<AddordeletorupdateBloc>(
                                              context)
                                          .add(DelletArticleEvent(
                                              articlId: article.articleId,
                                              collectionId:
                                                  article.articleType));
                                      BlocProvider.of<ArticleBloc>(context)
                                          .add(GetAllArticlesEvent());
                                    }
                                  },
                                ),
                              ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 8),
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
