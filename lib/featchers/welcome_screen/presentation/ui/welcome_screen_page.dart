import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/drawer_shop.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/drawer_data_cuibit/drawer_data_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/slider/slider.dart';
import 'package:mk/injection_container.dart' as di;
import '../bloc/secondcont_cuibit/secoundcont_cubit.dart';
import '../widgets/profileInwelcom/autre_profile_option.dart';
import '../widgets/ground_containers_botons.dart';
import '../widgets/bar_de_boton_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        backgroundColor: mybluebackgroundcolor,
        body: __buildbody(context),
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
          const AutreProfileOption(),
          const SliderCrusur()
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
