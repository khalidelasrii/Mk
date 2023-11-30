import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/drawer_shop.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';

import '../../../welcome_screen/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import '../widgets/grid_view_body.dart';

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
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   flexibleSpace:
      //       BlocBuilder<WelcomeArticleBlocBloc, WelcomeArticleBlocState>(
      //     builder: (context, state) {
      //       if (state is ShoppingWelcomState) {
      //         return MaterialButton(
      //             onPressed: () {
      //               BlocProvider.of<WelcomeArticleBlocBloc>(context)
      //                   .add(WelcomeBlocInitialEvent());
      //             },
      //             child: Container());
      //       } else {
      //         return const AppbarWelcome();
      //       }
      //     },
      //   ),
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const AppbarWelcome(),
                GridViewBody(
                  user: userconnect,
                ),
              ],
            ),
          ),
          BlocBuilder<DrawerDataCubit, DrawerDataState>(
            builder: (context, state) {
              if (state is DrawerDataInitial) {
                return const SizedBox();
              } else {
                return const DrawerShop();
              }
            },
          )
        ],
      ),
    );
  }
}
