import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../../../Authontification/domain/entitie/user.dart';
import '../bloc/add_delet_update/addordeletorupdate_bloc.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/drawer_boton.dart';
import 'add_article.dart';

class HomePage extends StatefulWidget {
  final Usr user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        dynamic x;

        if (state is ArticleInitial) {
          x = const CerclulareLodingWidget();
          return _fonction(x, widget.user);
        } else if (state is LodingArticlesState) {
          x = const CerclulareLodingWidget();
          return _fonction(x, widget.user);
        } else if (state is LodedArticlesState) {
          x = _streamBuilderWidget(state.articles);
          return _fonction(x, widget.user);
        } else if (state is ErrorArticlesState) {
          x = MessageDisplay(message: state.message);
          return _fonction(x, widget.user);
        }
        return const SizedBox();
      },
    );
  }
}

AppBar _buildAppbar(BuildContext context, Usr user) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.black,
    title: Row(
      children: [
        SizedBox(
          height: 40,
          child: Image.asset('images/MK.png'),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          child: user.profile == null
              ? Image.network('${user.profile}')
              : Text(user.email),
        ),
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).singOut();
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
              const Expanded(child: SizedBox()),
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: articlesListe,
      );
    },
  );
}

_fonction(dynamic x, Usr user) {
  return ResponsiveLayote(
      disktopScafolde: HomePageDesktop(
        x: x,
        user: user,
      ),
      moubileSccafolde: HomePageMobile(
        x: x,
        user: user,
      ));
}

//! Desktop Home paga
class HomePageDesktop extends StatelessWidget {
  final dynamic x;
  final Usr user;
  const HomePageDesktop({super.key, required this.x, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: _buildAppbar(context, user),
      body: _buildBody(context, x),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

//! Mobile Home paga

class HomePageMobile extends StatelessWidget {
  final dynamic x;
  final Usr user;

  const HomePageMobile({super.key, required this.x, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: _buildAppbar(context, user),
      body: _buildBody(context, x),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}
