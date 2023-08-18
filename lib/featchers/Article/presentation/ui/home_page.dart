import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/loded_widget.dart';
import 'add_article.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

//! Mobile Home paga

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

AppBar _buildAppbar() {
  return AppBar(
    backgroundColor: Colors.red,
  );
}

Widget _buildBody() {
  return BlocBuilder<ArticleBloc, ArticleState>(
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
        return MessageDisplay(message: state.message);
      }
      return const SizedBox();
    },
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

Future<void> _onRefrech(BuildContext context) async {
  BlocProvider.of<ArticleBloc>(context).add(RefreshArticlesEvent());
}
