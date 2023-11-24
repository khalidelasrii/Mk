import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/slider/slider.dart';
import 'package:mk/injection_container.dart' as di;
import '../../../../core/Widgets/bar_de_recherche.dart';
import '../bloc/secondcont_cuibit/secoundcont_cubit.dart';
import '../widgets/autre_profile_option.dart';
import '../widgets/ground_containers_botons.dart';
import '../widgets/bar_de_boton_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? userr) {
        if (userr != null) {
          setState(() {
            user = userr;
          });
        }
      },
    );
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
            backgroundColor: const Color.fromARGB(183, 0, 0, 0),
            body: _buildbody(context, user)));
  }

  _buildbody(BuildContext context, User? user) {
    return SingleChildScrollView(
        child: Column(children: [
      Stack(alignment: AlignmentDirectional.topEnd, children: [
        Container(
          color: Colors.black,
          height: 500,
          width: double.infinity,
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'images/bck.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            //! Appbar Widget

            AppbarWelcome(
              user: user,
            ),

            BlocBuilder<WelcomeArticleBlocBloc, WelcomeArticleBlocState>(
              builder: (context, state) {
                if (state is RecherchStartstate) {
                  //! Le Box de recherche :
                  return const BardeRocherche();
                } else {
                  //! Les Boton de tous les categorie
                  return const BarDeBotonPage();
                }
              },
            ),
            //!   la Sous liste du Catégorie:
            const ContainerAllCategorie(),
          ],
        ),
      ]),
      const AutreProfileOption(),
      const SliderCrusur()
    ]));
  }
}
