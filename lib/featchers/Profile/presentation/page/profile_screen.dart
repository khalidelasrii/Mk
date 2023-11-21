import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import '../widgets/about_nous.dart';
import '../widgets/article_profile.dart';
import '../widgets/profile_Info.dart';
import 'package:mk/injection_container.dart' as di;

Color mygreen = const Color.fromARGB(115, 76, 175, 79);
Color myteal = const Color.fromARGB(129, 0, 150, 135);
Color myblue = const Color.fromARGB(121, 33, 149, 243);
Color profilcolor = const Color.fromARGB(84, 0, 0, 0);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final List<Widget> pages = [
      const ProfileInfo(),
      MesArticlesDeProfile(user: user),
      const AboutNous(),
    ];
    return BlocProvider(
        create: (context) => di.sl<ProfileBloc>(),
        child: Scaffold(
          backgroundColor: mybluebackgroundcolor,
          body: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppbarWelcome(
                      user: user,
                    ),
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
                                            user!.photoURL!,
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
                                      user!.email!,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 200, 200, 200)),
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
          ),
        ));
  }
}
