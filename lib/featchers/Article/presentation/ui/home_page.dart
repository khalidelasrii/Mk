import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
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

AppBar _buildAppbar(BuildContext context, Usr? user, bool isDiscktop) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: mybluebackgroundcolor,
    title: Row(
      children: [
        SizedBox(
          height: 40,
          child: Image.asset('images/MK.png'),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {},
            child: const Icon(Icons.search)),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
            child: user!.profile == null
                ? Image.network('${user.profile}')
                : Text(user.email)),
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
              backgroundColor: Color.fromARGB(213, 68, 137, 255),
              width: 150,
            )
          : const SizedBox(),
      BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is LodedAllarticles) {
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
      backgroundColor: Colors.grey.shade300,
      appBar: _buildAppbar(context, user, true),
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
      appBar: _buildAppbar(context, user, false),
      body: _buildBody(context, isDisktop, user),
      floatingActionButton: _floatingActionButton(context, user),
    );
  }
}
