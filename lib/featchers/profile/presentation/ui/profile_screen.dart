import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/profile/presentation/bloc/get_mes_articles_cuibit/get_mes_articles_cubit.dart';
import 'package:mk/injection_container.dart' as di;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? usr) {
        if (usr != null) {
          setState(() {
            user = usr;
          });
        }
      },
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                di.sl<GetMesArticlesCubit>()..mesArticleLoding(user!.email!),
          )
        ],
        child: Scaffold(
          backgroundColor: mybluebackgroundcolor,
          body: _buildBody(),
        ));
  }

  _buildBody() {
    return Column(
      children: [
        AppbarWelcom().appBarWidget(context, user),
        BlocBuilder<GetMesArticlesCubit, GetMesArticlesState>(
          builder: (context, state) {
            return const SizedBox(
              child: Center(
                child: CerclulareLodingWidget(),
              ),
            );
          },
        ),
      ],
    );
  }
}
