import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/adoor_articles_cuibit/adoor_articles_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/appbafont_cuibit/appbafont_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/slider/slider.dart';
import 'package:mk/injection_container.dart' as di;
import '../../../../core/Widgets/bar_de_recherche.dart';
import '../bloc/recherch_cuibit/recherch_cubit.dart';
import '../bloc/secondcont_cuibit/secoundcont_cubit.dart';
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
          BlocProvider(create: (context) => di.sl<AdoorArticlesCubit>()),
        ],
        child: Scaffold(
            backgroundColor: const Color.fromARGB(183, 0, 0, 0),
            // appBar: _buildAppbar(),
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
            //! La bar de recherche :
            BlocBuilder<ToolbarCubit, ToolbarState>(
              builder: (context, state) {
                if (state is ToolbarInitial) {
                  return BardeRocherche().bardeRocherche(context);
                } else {
                  return const SizedBox();
                }
              },
            ),
            //! Les Boton de tous les categorie
            BlocBuilder<RecherchCubit, RecherchState>(
              builder: (context, state) {
                if (state is RecherchStartstate) {
                  return const SizedBox();
                } else {
                  return BarDeBotonPage().secondBar(context);
                }
              },
            ),

            //!   la Sous liste du Catégorie:

            ContainerAllCategorie().containerAllCategorie(),
          ],
        ),
        BlocBuilder<AppbafontCubit, AppbafontState>(
          builder: (context, state) {
            if (state is AppbafontInitial) {
              return const SizedBox();
            } else if (state is AppbarFontPressedState) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: MouseRegion(
                  onExit: (_) {
                    BlocProvider.of<AppbafontCubit>(context)
                        .appBarIsExitEvent();
                  },
                  child: Container(
                    height: 300,
                    width: 200,
                    color: Colors.amber,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ]),
      const SizedBox(
        height: 20,
      ),
      SliderCrusur().slider()
    ]));
  }
}
