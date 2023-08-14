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
        appBar: AppBar(),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleInitial) {
              return const LowdingWidget();
            } else if (state is LodingArticlesState) {
              return const LowdingWidget();
            } else if (state is LodedArticlesState) {
              return LodedWidget(articles: state.articles);
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
