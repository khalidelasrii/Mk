import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/Widgets/drawer_shop.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';
import 'package:mk/featchers/Profile/presentation/bloc/get_Mes_article/get_mes_article_cubit.dart';
import 'package:mk/featchers/Profile/presentation/bloc/get_profile/get_pofile_cubit.dart';
import '../../../Authontification/domain/entitie/user.dart';
import '../../../welcome_screen/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import '../widgets/about_nous.dart';
import '../widgets/article_profile.dart';
import '../widgets/profile_Info.dart';
import 'package:mk/injection_container.dart' as di;

Color mygreen = const Color.fromARGB(115, 76, 175, 79);
Color myteal = const Color.fromARGB(129, 0, 150, 135);
Color myblue = const Color.fromARGB(121, 33, 149, 243);
Color profilcolor = const Color.fromARGB(84, 0, 0, 0);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final Usr user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetPofileCubit>(context).getProfileEvent(ProfileUser(
        email: widget.user.email,
        name: widget.user.name,
        uid: widget.user.uid));
    return BlocProvider(
      create: (context) => di.sl<GetMesArticleCubit>(),
      child: Scaffold(
        backgroundColor: mybluebackgroundcolor,
        body: Stack(
          children: [
            const AppbarWelcome(),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: BlocBuilder<GetPofileCubit, GetPofileState>(
                builder: (context, state) {
                  if (state is LodidAutreProfileState) {
                    final usr = state.articles;
                    List<Widget> pages = [
                      const ProfileInfo(),
                      MesArticlesDeProfile(
                          user: Usr(
                              email: usr.email, uid: usr.uid, name: usr.name)),
                      const AboutNous(),
                    ];
                    return SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    usr.profileUrl != null
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipOval(
                                                child: Image.network(
                                              usr.profileUrl!,
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
                                                      BorderRadius.circular(
                                                          100)),
                                              child: const Icon(
                                                Icons.person,
                                                size: 100,
                                              ),
                                            ),
                                          ),
                                    Text(
                                      usr.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        usr.email,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 200, 200, 200)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                        color: Colors.orangeAccent),
                                    child: BottomNavigationBar(
                                      backgroundColor: Colors.transparent,
                                      selectedItemColor: Colors.indigo,
                                      unselectedItemColor: Colors.white,
                                      elevation: 0,
                                      currentIndex: currIndex,
                                      onTap: (int newIndex) {
                                        setState(() {
                                          currIndex = newIndex;
                                        });
                                      },
                                      items: const [
                                        BottomNavigationBarItem(
                                          icon: Icon(Icons.person),
                                          label: 'Profil',
                                        ),
                                        BottomNavigationBarItem(
                                          icon: Icon(Icons.category),
                                          label: 'Articles',
                                        ),
                                        BottomNavigationBarItem(
                                          icon: Icon(Icons.info),
                                          label: 'About Nous',
                                        ),
                                      ],
                                    ),
                                  ),
                                  pages[currIndex],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const CerclulareLodingWidget();
                  }
                },
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
      ),
    );
  }
}
