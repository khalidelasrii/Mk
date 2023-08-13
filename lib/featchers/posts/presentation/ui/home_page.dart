import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/posts/presentation/bloc/article/article_bloc.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../widgets/loded_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String screenRout = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }
}

AppBar _buildAppbar(BuildContext context) => AppBar();

Widget _buildBody(BuildContext context) {
  return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
    if (state is LodingArticlesState) {
      return const LowdingWidget();
    } else if (state is LodedArticlesState) {
      return LodedWidget(articles: state.articles);
    } else if (state is ErrorArticlesState) {
      return MessageDisplay(
        message: state.message,
        color: Colors.red,
      );
    }
    return const SizedBox();
  });
}
