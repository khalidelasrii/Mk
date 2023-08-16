import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/loded_widget.dart';
import 'add_article.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String screenRout = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayote(
      disktopScafolde: HomePageDesktop(),
      moubileSccafolde: HomePageMobile(),
    );
  }
}

//! Desktop Home paga
class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddArticle.screenRout);
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleInitial) {
              return const LowdingWidget();
            } else if (state is LodingArticlesState) {
              return const LowdingWidget();
            } else if (state is LodedArticlesState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefrech(context),
                  child: LodedWidget(articles: state.articles));
            } else if (state is ErrorArticlesState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}

//! Mobile Home paga
class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddArticle.screenRout);
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleInitial) {
              return const LowdingWidget();
            } else if (state is LodingArticlesState) {
              return const LowdingWidget();
            } else if (state is LodedArticlesState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefrech(context),
                  child: LodedWidget(articles: state.articles));
            } else if (state is ErrorArticlesState) {
              return MessageDisplay(
                message: state.message,
              );
            }
            return const SizedBox();
          },
        ));
  }
}
//!  on refresh paga

Future<void> _onRefrech(BuildContext context) async {
  BlocProvider.of<ArticleBloc>(context).add(RefreshArticlesEvent());
}
