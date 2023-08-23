import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../../../Authontification/presentation/bloc/auth/auth_bloc.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/loded_widget.dart';
import 'add_article.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          _showSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SingInState) {
          return const ResponsiveLayote(
            disktopScafolde: HomePageDesktop(),
            moubileSccafolde: HomePageMobile(),
          );
        } else if (state is SingOutState) {
          return SingIn();
        }
        return const Scaffold(
          body: Center(child: Text(' try a gain')),
        );
      },
    );
  }
}

//! Desktop Home paga
class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: _buildAppbar(context),
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

//! Mobile Home paga

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: _buildAppbar(context),
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

AppBar _buildAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.red,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const SingIn()));
            BlocProvider.of<AuthBloc>(context).add(SingOutEvent());
          },
          icon: const Icon(Icons.exit_to_app))
    ],
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

void _showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(
          seconds:
              2), // Set the duration for how long the snackbar will be visible
    ),
  );
}
