import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

class BarBotonsAllPages {
  categoriePageBoton(BuildContext context, bool isin, int bontonNembr,
      String textBoton, Color color1, Color color2) {
    return MouseRegion(
      onEnter: (_) {
        isin = true;
        BlocProvider.of<ToolbarCubit>(context).categorie1(bontonNembr);
      },
      onExit: (_) {
        isin = false;
        BlocProvider.of<ToolbarCubit>(context).isInitial();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          color: color1,
          elevation: 0,
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.list,
                color: color2,
              ),
              Text(
                textBoton,
                style: TextStyle(
                  color: color2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
