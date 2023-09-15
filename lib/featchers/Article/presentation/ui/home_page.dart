import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_test.dart';

import '../../../Authontification/domain/entitie/user.dart';
import '../widgets/grid_view_body.dart';
import 'add_article.dart';

class HomePage extends StatelessWidget {
  final Usr user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayote(
        disktopScafolde: HomePageDesktop(
          user: user,
          isDisktop: true,
        ),
        moubileSccafolde: HomePageMobile(
          isDisktop: false,
          user: user,
        ));
  }
}

AppBar _buildAppbar(BuildContext context, Usr? user, bool isDiscktop) {
  bool serchPressed = false;

  return AppBar(
    flexibleSpace: StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Padding(
          padding: EdgeInsets.only(right: serchPressed == true ? 00 : 300),
          child: Row(
            mainAxisAlignment: serchPressed == true
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
            children: [
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  SizedBox(
                      width: serchPressed == true ? 400 : 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          // Gérer les modifications du texte de recherche ici
                        },
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          serchPressed = true;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color:
                            serchPressed == true ? Colors.amber : Colors.black,
                      ))
                ],
              ),
            ],
          ),
        );
      },
    ),
    backgroundColor: mybluebackgroundcolor,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Image.asset('images/MK.png'),
    ),
    actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              child: user!.profile == null
                  ? Image.network('${user.profile}')
                  : Text(user.email)),
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      IconButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).singOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const WelcomeScreenTest()));
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
