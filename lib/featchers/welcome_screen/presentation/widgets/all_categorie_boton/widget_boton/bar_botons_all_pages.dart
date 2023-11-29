import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';

class BarBotonsAllPages extends StatelessWidget {
  const BarBotonsAllPages(
      {super.key,
      required this.bontonNembr,
      required this.textBoton,
      required this.botonColor,
      required this.textColor});
  final int bontonNembr;
  final String textBoton;
  final Color botonColor, textColor;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        bontonNembr == 1
            ? BlocProvider.of<WelcomeArticleBlocBloc>(context)
                .add(AdoorArticlesloadingEvent())
            : null;

        BlocProvider.of<ToolbarCubit>(context).categorie1(bontonNembr);
      },
      onExit: (_) {
        BlocProvider.of<ToolbarCubit>(context).isInitial();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          color: botonColor,
          elevation: 0,
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.list,
                color: textColor,
              ),
              Text(
                textBoton,
                style: TextStyle(
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
