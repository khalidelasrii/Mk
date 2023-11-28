import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
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
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          setState(() {
            userconnect = user;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mybluebackgroundcolor,
      appBar: AppBar(flexibleSpace: const AppbarWelcome()),
      body: GridViewBody(
        user: userconnect,
      ),
      floatingActionButton: userconnect != null
          ? _floatingActionButton(context, userconnect)
          : null,
    );
  }
}

Widget _floatingActionButton(BuildContext context, User? user) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AddOrUpdateArticle(
                    isUpdate: false,
                    user: user,
                  )));
    },
    child: const Icon(Icons.add),
  );
}
