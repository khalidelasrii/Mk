import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../../../Authontification/domain/entitie/user.dart';
import '../../domaine/entitie/profile_articles.dart';
import '../bloc/get_Mes_article/get_mes_article_cubit.dart';
import '../page/profile_screen.dart';

class MesArticlesDeProfile extends StatefulWidget {
  const MesArticlesDeProfile({Key? key, required this.user}) : super(key: key);
  final Usr user;

  @override
  MesArticlesDeProfileState createState() => MesArticlesDeProfileState();
}

class MesArticlesDeProfileState extends State<MesArticlesDeProfile> {
  int currentIndex = 0;

  final List<String> pages = [
    "AllCategorie",
    "Forniture",
    "Cartables",
    "Livres",
    "Stylo",
    "Autres"
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetMesArticleCubit>(context).getMesArticleEvent(
      ProfleArticle(
        article: '',
        articleId: '',
        email: widget.user.email,
        name: '',
        prix: '',
        articleType: pages[currentIndex],
        uid: widget.user.uid,
      ),
    );
    return Column(
      children: [
        BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(98, 0, 0, 0),
              icon: Icon(Icons.category_outlined),
              label: 'AllCategorie',
            ),
            BottomNavigationBarItem(
              backgroundColor: mygreen,
              icon: const Icon(Icons.calendar_view_week_rounded),
              label: 'Forniture',
            ),
            BottomNavigationBarItem(
              backgroundColor: myblue,
              icon: const Icon(Icons.wallet_travel_outlined),
              label: 'Cartables',
            ),
            BottomNavigationBarItem(
              backgroundColor: myblue,
              icon: const Icon(Icons.menu_book),
              label: 'Livres',
            ),
            BottomNavigationBarItem(
              backgroundColor: myblue,
              icon: const Icon(Icons.ramp_left_sharp),
              label: 'Stylo',
            ),
            BottomNavigationBarItem(
              backgroundColor: myblue,
              icon: const Icon(Icons.all_inclusive_outlined),
              label: 'Autres',
            ),
          ],
        ),
        Container(
            constraints: const BoxConstraints(maxWidth: double.infinity),
            child: BlocBuilder<GetMesArticleCubit, GetMesArticleState>(
              builder: (context, state) {
                if (state is LodidArticleState) {
                  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: state.articles,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<ProfleArticle> mesArticle =
                            snapshot.data!.docs.map((subdata) {
                          final sub = subdata.data();
                          return ProfleArticle(
                              articleUrl: sub['articleUrl'],
                              email: sub['email'],
                              article: sub['article'],
                              name: sub['name'],
                              prix: sub['prix'],
                              articleId: sub['id'],
                              articleType: sub['type'],
                              uid: sub['userId']);
                        }).toList();

                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: mesArticle.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6),
                          itemBuilder: (context, index) {
                            final article = mesArticle[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                hoverColor: Colors.amber,
                                onPressed: () {
                                  // BlocProvider.of<ArticleBloc>(context)
                                  //     .add(AddoorlableArticlesEvent(article));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => ArticleProduit(
                                  //               article: article,
                                  //             )));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: GridTile(
                                      footer: Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 150),
                                          child: Text(article.email)),
                                      header: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                                child: Text(article.name)),
                                          ),
                                          DropdownButton<String>(
                                            underline: const SizedBox(),
                                            isDense: true,
                                            icon: const Icon(
                                                Icons.more_vert_outlined),
                                            elevation: 0,
                                            dropdownColor: const Color.fromARGB(
                                                101, 77, 61, 61),
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
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (_) =>
                                                //             AddOrUpdateArticle(
                                                //               isUpdate: true,
                                                //               article: article,
                                                //               user: user,
                                                //             )));
                                              } else if (newValue == '2') {
                                                // BlocProvider.of<
                                                //             AddordeletorupdateBloc>(
                                                //         context)
                                                //     .add(DelletArticleEvent(
                                                //         articlId: article.id,
                                                //         collectionId: article.type));
                                                // BlocProvider.of<ArticleBloc>(context)
                                                //     .add(GetAllArticlesEvent());
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CachedNetworkImage(
                                          imageUrl: article.articleUrl!,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const CerclulareLodingWidget();
                      }
                    },
                  );
                }
                return const Center(child: CerclulareLodingWidget());
              },
            )),
      ],
    );
  }
}
