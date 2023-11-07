import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';
import 'package:mk/injection_container.dart' as di;

import '../../../../core/Widgets/core_widgets.dart';
import '../bloc/get_mes_articles_cuibit/get_mes_articles_cubit.dart';
import '../widgets/grid_view_body.dart';

Color mygreen = const Color.fromARGB(115, 76, 175, 79);
Color myteal = const Color.fromARGB(129, 0, 150, 135);
Color myblue = const Color.fromARGB(121, 33, 149, 243);
Color profilcolor = const Color.fromARGB(84, 0, 0, 0);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<GetMesArticlesCubit>()..mesArticleLoding(),
          ),
        ],
        child: Scaffold(
          backgroundColor: mybluebackgroundcolor,
          body: _buildBody(context, user),
        ));
  }
}

_buildBody(BuildContext context, User? user) {
  int currentIndex = 0;
  final List<Widget> pages = [
    const ProfileInfo(),
    MesArticlesDeProfile(user: user),
    const AboutNous(),
  ];

  return StatefulBuilder(
    builder: (context, setState) {
      return SingleChildScrollView(
        child: Column(
          children: [
            AppbarWelcom().appBarWidget(context, user),
            BottomNavigationBar(
              backgroundColor: const Color.fromARGB(98, 0, 0, 0),
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.white,
              elevation: 0,
              currentIndex: currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              items: [
                const BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(98, 0, 0, 0),
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
                BottomNavigationBarItem(
                  backgroundColor: mygreen,
                  icon: const Icon(Icons.category),
                  label: 'Articles',
                ),
                BottomNavigationBarItem(
                  backgroundColor: myblue,
                  icon: const Icon(Icons.info),
                  label: 'About Nous',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          user!.photoURL != null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                      child: Image.network(
                                    user.photoURL!,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  )),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.person,
                                      size: 100,
                                    ),
                                  ),
                                ),
                          const Text(
                            'Name and Prnam',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              user.email!,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 200, 200, 200)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pages[currentIndex]
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

//! About Nous
class AboutNous extends StatelessWidget {
  const AboutNous({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
        color: myblue,
        child: MaterialButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).singOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const WelcomeScreen()));
            },
            child: Container(
                color: Colors.amber,
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Deconection',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}

//! Profile Info
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
        color: profilcolor,
      ),
    );
  }
}
//! Articles

class MesArticlesDeProfile extends StatelessWidget {
  const MesArticlesDeProfile({super.key, required this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
        color: mygreen,
        child: BlocBuilder<GetMesArticlesCubit, GetMesArticlesState>(
          builder: (context, state) {
            if (state is LodidMesArticlesState) {
              return GridViewBody(
                articles: state.articles,
                isDisktop: true,
                user: user,
              );
            } else {
              return const SizedBox(
                child: Center(
                  child: CerclulareLodingWidget(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
