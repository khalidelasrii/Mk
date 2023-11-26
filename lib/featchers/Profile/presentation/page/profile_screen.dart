import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';
import 'package:mk/featchers/Profile/presentation/bloc/get_profile/get_pofile_cubit.dart';
import '../../../Authontification/domain/entitie/user.dart';
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
  int currentIndex = 0;
  @override
  void initState() {
    BlocProvider.of<GetPofileCubit>(context).getProfileEvent(ProfileUser(
        email: widget.user.email!,
        name: widget.user.name ?? "",
        uid: widget.user.uid!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<GetPofileCubit>(),
      child: Scaffold(
          backgroundColor: mybluebackgroundcolor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: const AppbarWelcome(),
          ),
          body: BlocBuilder<GetPofileCubit, GetPofileState>(
            builder: (context, state) {
              if (state is LodidAutreProfileState) {
                final usr = state.articles;
                List<Widget> pages = [
                  const ProfileInfo(),
                  MesArticlesDeProfile(
                      user:
                          Usr(email: usr.email, uid: usr.uid, name: usr.name)),
                  const AboutNous(),
                ];
                return SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
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
                                                BorderRadius.circular(100)),
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
                                      color:
                                          Color.fromARGB(255, 200, 200, 200)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Column(
                            children: [
                              BottomNavigationBar(
                                backgroundColor:
                                    const Color.fromARGB(98, 0, 0, 0),
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
                                    backgroundColor:
                                        Color.fromARGB(98, 0, 0, 0),
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
                              pages[currentIndex]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CerclulareLodingWidget();
              }
            },
          )),
    );
  }
}
