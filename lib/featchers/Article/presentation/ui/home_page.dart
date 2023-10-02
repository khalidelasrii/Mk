import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';

import '../widgets/grid_view_body.dart';
import 'add_article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? userconnect;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          setState(() {
            userconnect = user;
          });
        }
      },
    );
    return Scaffold(
      backgroundColor: mybluebackgroundcolor,
      body: _buildBody(context, true, userconnect),
      floatingActionButton:
          userconnect != null ? _floatingActionButton(context) : null,
    );
  }
}

Widget _buildBody(BuildContext context, bool isDisktop, User? user) {
  return Column(
    children: [
      AppbarWelcom().appBarWidget(context, user),
      BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is LodedAllarticles) {
            return GridViewBody(
              articles: state.articles,
              isDisktop: isDisktop,
            );
          } else {
            return const Expanded(
              child: SizedBox(
                child: CerclulareLodingWidget(),
              ),
            );
          }
        },
      ),
    ],
  );
}

Widget _floatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AddOrUpdateArticle(
                    isUpdate: false,
                  )));
    },
    child: const Icon(Icons.add),
  );
}
