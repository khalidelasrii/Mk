import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/article_produit.dart';
import '../../featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import '../const_widget/my_colors.dart';

class DrawerShop extends StatelessWidget {
  const DrawerShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: MaterialButton(
            onPressed: () {
              BlocProvider.of<DrawerDataCubit>(context).drawerdataInitiale();
            },
            child: Container(),
          ),
        ),
        Expanded(
            child: Container(
                height: double.infinity,
                color: mybluebackgroundcolor,
                child: BlocBuilder<DrawerDataCubit, DrawerDataState>(
                  builder: (context, state) {
                    if (state is SearchDrawerState) {
                      return const SercheDrawer();
                    } else if (state is ShoppingDrawerState) {
                      return ShopWaletDrawer();
                    } else if (state is ProfileDrawerState) {
                      return Text("Profile");
                    } else {
                      return ListView(
                        children: const [
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              "Panier 0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              "Aucune article dans votre panier",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      );
                    }
                  },
                )))
      ],
    );
  }
}

class ShopWaletDrawer extends StatelessWidget {
  const ShopWaletDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SercheDrawer extends StatefulWidget {
  const SercheDrawer({super.key});

  @override
  State<SercheDrawer> createState() => _SercheDrawerState();
}

class _SercheDrawerState extends State<SercheDrawer> {
  TextEditingController textEditingController = TextEditingController();
  String serche = "";
  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 55),
          child: BlocBuilder<WelcomeArticleBlocBloc, WelcomeArticleBlocState>(
            builder: (context, state) {
              if (state is RecherchStartstate) {
                return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: state.value,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Article> document = snapshot.data!.docs.map((sub) {
                        final data = sub.data();
                        return Article(
                            articleUrl: data["articleUrl"],
                            uid: data["uid"],
                            articleType: data["articleType"],
                            email: data["email"],
                            article: data["article"],
                            name: data["name"],
                            prix: data["prix"],
                            articleId: data["articleId"]);
                      }).toList();

                      return ListView.builder(
                        itemCount: document.length,
                        itemBuilder: (context, index) {
                          Article article = document[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ArticleProduit(article: article)));
                            },
                            leading: Image.network(
                              article.articleUrl!,
                              fit: BoxFit.cover,
                            ),
                            trailing: Text(article.prix),
                            title: Text(article.name),
                            subtitle: Text(article.articleType),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No Data'));
                    }
                  },
                );
              }
              return const Center(child: Text('No Data'));
            },
          ),
        ),
        SearchBar(
          controller: textEditingController,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 10.0)),
          onTap: () {},
          onChanged: (value) {
            BlocProvider.of<WelcomeArticleBlocBloc>(context)
                .add(RecherchStatEvent(value: value));
            serche = value;
          },
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          trailing: <Widget>[
            IconButton(
              onPressed: () {
                textEditingController.clear();
                BlocProvider.of<WelcomeArticleBlocBloc>(context)
                    .add(RecherchStatEvent(value: serche));
              },
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
      ],
    );
  }
}

 
                            
  //                          

//! profile Materiaele 
    // Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (_) => AddOrUpdateArticle(
    //                 isUpdate: false,
    //                 user: user,
    //               )));
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (_) => ProfileScreen(
    //                                   user: Usr(
    //                                       email: user.email!,
    //                                       uid: user.uid,
    //                                       name: user.displayName ?? 'Milo'),
    //                                 )));