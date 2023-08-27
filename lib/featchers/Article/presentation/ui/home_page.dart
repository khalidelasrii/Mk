import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Authontification/presentation/ui/auth.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../bloc/add_delet_update/addordeletorupdate_bloc.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/drawer_boton.dart';
import 'add_article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        dynamic x;

        if (state is ArticleInitial) {
          x = const CerclulareLodingWidget();
          return _fonction(x);
        } else if (state is LodingArticlesState) {
          x = const CerclulareLodingWidget();
          return _fonction(x);
        } else if (state is LodedArticlesState) {
          x = _streamBuilderWidget(state.articles);
          return _fonction(x);
        } else if (state is ErrorArticlesState) {
          x = MessageDisplay(message: state.message);
          return _fonction(x);
        }
        return const SizedBox();
      },
    );
  }
}

//! Desktop Home paga
class HomePageDesktop extends StatelessWidget {
  final dynamic x;
  const HomePageDesktop({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: _buildAppbar(context),
      body: _buildBody(context, x),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

//! Mobile Home paga

class HomePageMobile extends StatelessWidget {
  final dynamic x;

  const HomePageMobile({super.key, required this.x});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: _buildAppbar(context),
      body: _buildBody(context, x),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

AppBar _buildAppbar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.black,
    title: Row(
      children: [
        SizedBox(
          height: 40,
          child: Image.asset('images/MK.png'),
        )
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();

            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Auth()));
          },
          icon: const Icon(Icons.exit_to_app))
    ],
  );
}

Widget _buildBody(BuildContext context, dynamic x) {
  return Row(
    children: [
      Container(
        height: double.infinity,
        width: 200,
        color: Colors.black,
        child: DrawerBoton(),
      ),
      Expanded(
        child: Container(
          color: Colors.blueGrey,
          child: x,
        ),
      )
    ],
  );
}

Widget _floatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const AddOrUpdateArticle(
                    isUpdate: false,
                  )));
    },
    child: const Icon(Icons.add),
  );
}

_streamBuilderWidget(Stream<QuerySnapshot<Map<String, dynamic>>> xxx) {
  return StreamBuilder(
    stream: xxx,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      final List<Row> articlesListe = [];

      if (snapshot.hasData) {
        final articles = snapshot.data!.docs.reversed.toList();
        for (var article in articles) {
          final articleListe = Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article['name']),
                  Text(article['article']),
                  Text(article['prix'].toString()),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<AddordeletorupdateBloc>(context).add(
                        DelletArticleEvent(articlId: article.id.toString()));
                  },
                  icon: const Icon(Icons.delete))
            ],
          );

          articlesListe.add(articleListe);
        }
      }

      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: articlesListe,
      );
    },
  );
}

_fonction(dynamic x) {
  return ResponsiveLayote(
      disktopScafolde: HomePageDesktop(
        x: x,
      ),
      moubileSccafolde: HomePageMobile(x: x));
}
