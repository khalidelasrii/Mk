import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Article/presentation/widgets/grid_view_body.dart';
import 'package:mk/injection_container.dart' as di;

import '../bloc/get_mes_articles_cuibit/get_mes_articles_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final User? user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<GetMesArticlesCubit>()
              ..mesArticleLoding(widget.user!.email!),
          )
        ],
        child: Scaffold(
          backgroundColor: mybluebackgroundcolor,
          body: _buildBody(context, widget.user),
        ));
  }
}

_buildBody(BuildContext context, User? user) {
  return Column(
    children: [
      AppbarWelcom().appBarWidget(context, user),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    user!.photoURL != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Image.network(user.photoURL!)),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Icon(
                                Icons.person,
                                size: 100,
                              ),
                            ),
                          ),
                    Text(
                      user.email!,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 200, 200, 200)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}

// BlocBuilder<GetMesArticlesCubit, GetMesArticlesState>(
//       builder: (context, state) {
//         if (state is LodidMesArticlesState) {
//           return GridViewBody(
//             articles: state.articles,
//             isDisktop: true,
//             user: user,
//           );
//         } else {
//           return const SizedBox(
//             child: Center(
//               child: CerclulareLodingWidget(),
//             ),
//           );
//         }
//       },
//     ),
