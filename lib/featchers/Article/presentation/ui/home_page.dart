import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';

import '../widgets/grid_view_body.dart';
import 'add_article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayote(
        disktopScafolde: HomePageDesktop(
          isDisktop: true,
        ),
        moubileSccafolde: HomePageMobile(
          isDisktop: false,
        ));
  }
}

// AppBar _buildAppbar(BuildContext context, bool isDiscktop) {

//   // bool serchPressed = false;

//   // return AppBar(
//   //   // flexibleSpace: StatefulBuilder(
//   //   //   builder: (BuildContext context, setState) {
//   //   //     return Padding(
//   //   //       padding: EdgeInsets.only(right: serchPressed == true ? 00 : 300),
//   //   //       child: Row(
//   //   //         mainAxisAlignment: serchPressed == true
//   //   //             ? MainAxisAlignment.center
//   //   //             : MainAxisAlignment.end,
//   //   //         children: [
//   //   //           Stack(
//   //   //             alignment: AlignmentDirectional.centerEnd,
//   //   //             children: [
//   //   //               SizedBox(
//   //   //                   width: serchPressed == true ? 400 : 40,
//   //   //                   child: TextField(
//   //   //                     decoration: InputDecoration(
//   //   //                       hintText: 'Rechercher...',
//   //   //                       filled: true,
//   //   //                       fillColor: Colors.white,
//   //   //                       border: OutlineInputBorder(
//   //   //                         borderRadius: BorderRadius.circular(10),
//   //   //                       ),
//   //   //                     ),
//   //   //                     onChanged: (value) {
//   //   //                       // Gérer les modifications du texte de recherche ici
//   //   //                     },
//   //   //                   )),
//   //   //               IconButton(
//   //   //                   onPressed: () {
//   //   //                     setState(() {
//   //   //                       serchPressed = true;
//   //   //                     });
//   //   //                   },
//   //   //                   icon: Icon(
//   //   //                     Icons.search,
//   //   //                     color:
//   //   //                         serchPressed == true ? Colors.amber : Colors.black,
//   //   //                   ))
//   //   //             ],
//   //   //           ),
//   //   //         ],
//   //   //       ),
//   //   //     );
//   //   //   },
//   //   // ),
//   //   backgroundColor: mybluebackgroundcolor,
//   //   leading: Padding(
//   //     padding: const EdgeInsets.only(left: 8.0),
//   //     child: Image.asset('images/MK.png'),
//   //   ),
//   //   actions: [
//   //     const SizedBox(
//   //       width: 20,
//   //     ),
//   //     IconButton(
//   //         onPressed: () {
//   //           BlocProvider.of<AuthCubit>(context).singOut();
//   //           Navigator.push(context,
//   //               MaterialPageRoute(builder: (_) => const WelcomeScreen()));
//   //         },
//   //         icon: const Icon(Icons.exit_to_app))
//   //   ],
//   // );
// }

Widget _buildBody(BuildContext context, bool isDisktop) {
  return Column(
    children: [
      AppbarWelcom().appBarWidget(context),
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

//! Desktop Home paga
class HomePageDesktop extends StatelessWidget {
  final bool isDisktop;
  const HomePageDesktop({
    super.key,
    required this.isDisktop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mybluebackgroundcolor,
      body: _buildBody(context, isDisktop),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}

//! Mobile Home paga

class HomePageMobile extends StatelessWidget {
  final bool isDisktop;
  const HomePageMobile({
    super.key,
    required this.isDisktop,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        width: 150,
        backgroundColor: Colors.black,
      ),
      backgroundColor: mybluebackgroundcolor,
      body: _buildBody(context, isDisktop),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}
