import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/presentation/ui/add_article.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/article_produit.dart';
import '../../featchers/Authontification/domain/entitie/user.dart';
import '../../featchers/Authontification/presentation/cubit/auth_cubit.dart';
import '../../featchers/Profile/presentation/page/profile_screen.dart';
import '../../featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import '../../featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';

class DrawerShop extends StatelessWidget {
  const DrawerShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        BlocProvider.of<DrawerDataCubit>(context).drawerdataInitiale();
      },
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: const SizedBox(),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: BlocBuilder<DrawerDataCubit, DrawerDataState>(
                builder: (context, state) {
                  if (state is SearchDrawerState) {
                    return const SercheDrawer();
                  } else if (state is ShoppingDrawerState) {
                    return const ShopWaletDrawer();
                  } else if (state is ProfileDrawerState) {
                    return const ProfileDrawerPage();
                  } else {
                    return Container(
                      color: Colors.red,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
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
          padding: const EdgeInsets.only(top: 52),
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

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          constraints: const BoxConstraints(maxHeight: 400),
                          child: ListView.builder(
                            itemCount: document.length,
                            itemBuilder: (context, index) {
                              Article article = document[index];
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ArticleProduit(
                                              article: article)));
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
                          ),
                        ),
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
        Padding(
          padding: const EdgeInsets.only(top: 6, right: 3),
          child: SizedBox(
            height: 50,
            child: SearchBar(
              controller: textEditingController,
              onTap: () {},
              onChanged: (value) {
                BlocProvider.of<WelcomeArticleBlocBloc>(context)
                    .add(RecherchStatEvent(value: value));
                serche = value;
              },
              leading: IconButton(
                  onPressed: () {
                    BlocProvider.of<WelcomeArticleBlocBloc>(context)
                        .add(RecherchStatEvent(value: serche));
                  },
                  icon: const Icon(Icons.search)),
              trailing: <Widget>[
                IconButton(
                  onPressed: () {
                    textEditingController.clear();
                    BlocProvider.of<DrawerDataCubit>(context)
                        .drawerdataInitiale();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileDrawerPage extends StatefulWidget {
  const ProfileDrawerPage({super.key});

  @override
  State<ProfileDrawerPage> createState() => _ProfileDrawerPageState();
}

class _ProfileDrawerPageState extends State<ProfileDrawerPage> {
  User? user;
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? userr) {
      userr != null
          ? setState(() {
              user = userr;
            })
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.indigo,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  focusColor: Colors.amber,
                  onTap: () {
                    BlocProvider.of<DrawerDataCubit>(context)
                        .drawerdataInitiale();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                                  user: Usr(
                                      email: user!.email!,
                                      uid: user!.uid,
                                      name: user!.displayName ?? 'Milo'),
                                )));
                  },
                  title: const Center(child: Text("Profile")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  focusColor: Colors.amber,
                  onTap: () {
                    BlocProvider.of<DrawerDataCubit>(context)
                        .drawerdataInitiale();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddOrUpdateArticle(
                                  isUpdate: false,
                                  user: user,
                                )));
                  },
                  title: const Center(child: Text("add Article")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  focusColor: Colors.amber,
                  onTap: () {
                    BlocProvider.of<DrawerDataCubit>(context)
                        .drawerdataInitiale();
                    BlocProvider.of<AuthCubit>(context).singOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const WelcomeScreen()));
                  },
                  title: const Center(child: Text("Deconection")),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
