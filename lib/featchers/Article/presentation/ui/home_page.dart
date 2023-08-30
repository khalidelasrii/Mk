import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';

import '../../../Authontification/domain/entitie/user.dart';
import '../widgets/grid_view_body.dart';
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
    return ResponsiveLayote(
        disktopScafolde: HomePageDesktop(
          user: widget.user,
          isDisktop: true,
        ),
        moubileSccafolde: HomePageMobile(
          isDisktop: false,
          user: widget.user,
        ));
  }
}

AppBar _buildAppbar(BuildContext context, Usr? user) {
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
        SizedBox(child: Image.network('${user!.profile}')),
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).singOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const SingIn()));
          },
          icon: const Icon(Icons.exit_to_app))
    ],
  );
}

Widget _buildBody(BuildContext context, bool isDisktop, Usr user) {
  return Row(
    children: [
      isDisktop == true
          ? const Drawer(
              backgroundColor: Colors.black,
              width: 90,
            )
          : const SizedBox(),
      BlocConsumer<ArticleBloc, ArticleState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LodedArticlesState) {
            return GridViewBody(
              articles: state.articles,
              user: user,
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

Widget _floatingActionButton(BuildContext context, Usr user) {
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

//! Desktop Home paga
class HomePageDesktop extends StatelessWidget {
  final Usr user;
  final bool isDisktop;
  const HomePageDesktop({
    super.key,
    required this.user,
    required this.isDisktop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: _buildAppbar(context, user),
      body: _buildBody(context, isDisktop, user),
      floatingActionButton: _floatingActionButton(context, user),
    );
  }
}

//! Mobile Home paga

class HomePageMobile extends StatelessWidget {
  final Usr user;
  final bool isDisktop;
  const HomePageMobile({
    super.key,
    required this.user,
    required this.isDisktop,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        width: 150,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.green,
      appBar: _buildAppbar(context, user),
      body: _buildBody(context, isDisktop, user),
      floatingActionButton: _floatingActionButton(context, user),
    );
  }
}
