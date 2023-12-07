import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/drawer_shop.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/opportunit%C3%A9s/approvisionnez_usine.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/opportunit%C3%A9s/deffiintion_widget.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/opportunit%C3%A9s/faites_commerce.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/opportunit%C3%A9s/slider.dart';
import 'package:mk/injection_container.dart' as di;
import '../../../Article/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import '../../../Authontification/presentation/cubit/auth_cubit.dart';
import '../../../Authontification/presentation/ui/sing_in.dart';
import '../bloc/secondcont_cuibit/secoundcont_cubit.dart';
import '../widgets/opportunités/calete_widget.dart';
import '../widgets/opportunités/opportunite.dart';
import '../widgets/ground_containers_botons.dart';
import '../widgets/bar_de_boton_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  User? user;
  bool auth = false;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? usr) {
      if (usr != null) {
        setState(() {
          user = usr;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<CategoriecheldrenCubit>()),
        BlocProvider(create: (context) => di.sl<SecoundcontCubit>()),
        BlocProvider(create: (context) => di.sl<WelcomeArticleBlocBloc>()),
        BlocProvider(create: (context) => di.sl<UsersWelcomeScreenCubit>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: __buildbody(context),
        bottomNavigationBar: user == null && auth == false
            ? Container(
                decoration: BoxDecoration(
                    color: mybluebackgroundcolor,
                    border: Border.all(color: Colors.amber, width: 1)),
                height: 50,
                constraints: const BoxConstraints(maxWidth: 50000),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "Explore with freedom! Log in to access exclusive areas and personalized features for our members",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MaterialButton(
                          hoverColor: Colors.amber,
                          color: Colors.green,
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).singGoogle();
                          },
                          child: const Text("Sing with Google")),
                      const SizedBox(
                        width: 12,
                      ),
                      MaterialButton(
                          hoverColor: Colors.amber,
                          color: Colors.green,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SingIn()));
                          },
                          child: const Text("Sing In")),
                      const SizedBox(
                        width: 12,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              auth = true;
                            });
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 12,
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }

  __buildbody(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
            child: Column(children: [
          Stack(alignment: Alignment.topCenter, children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  color: Colors.black,
                  height: 600,
                  width: double.infinity,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'images/GIFBACK.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text:
                                'Innovative Solutions for Global Transactions:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '\n\n  MiloTeck Ecommerce Platform Redefining International Commerce',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                //! Appbar Widget
                AppbarWelcome(),
                BarDeBotonPage(),
                //!   la Sous liste du Catégorie:
                ContainerAllCategorie(),
              ],
            ),
          ]),
          const CaleteWidgets(),
          const DeffinitionWidgets(),
          const SliderCarousel(),
          // text o safi
          Container(
            color: Colors.grey[200],
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Découvrez vos prochaines opportunités commerciales",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Opportunite(),
          // const AutreProfileOption(),
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Approvisionnez-vous directement auprès de l'usine:",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const ApprovisionnezUsine(),
          const FaitesCommerce(),
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Text(
                "Rationalisez la commande de la recherche à l’exécution, le tout en un seul endroit",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ])),
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
    );
  }
}
