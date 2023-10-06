import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'all_categorie_boton/widget_boton/bar_botons_all_pages.dart';

Color color1 = Colors.transparent;
Color color2 = Colors.transparent;
Color color3 = Colors.transparent;

Color color4 = Colors.transparent;

Color color5 = Colors.transparent;

Color color6 = Colors.transparent;
Color colortranst = Colors.white;
Color greenColor = const Color(0x464CAF4F);

class BarDeBotonPage {
  secondBar(BuildContext context) {
    categorieIs(BuildContext context, Color c1, Color c2, Color c3, Color c4,
        Color c5, Color c6, Color tran, Color contaiColor) {
      return Container(
          color: contaiColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarBotonsAllPages().categoriePageBoton(
                    context, false, 1, 'All Categorie', c1, tran),
                BarBotonsAllPages().categoriePageBoton(
                    context, false, 2, ' option 1', c2, tran),
                BarBotonsAllPages().categoriePageBoton(
                    context, false, 3, 'option 2', c3, tran),
                const SizedBox(
                  width: 20,
                ),
                BarBotonsAllPages().categoriePageBoton(
                    context, false, 4, 'option 3', c4, tran),
                BarBotonsAllPages().categoriePageBoton(
                    context, false, 5, 'option 4', c5, tran),
                BarBotonsAllPages().categoriePageBoton(
                    context, false, 6, 'option 5', c6, tran),
              ],
            ),
          ));
    }

    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is ToolbarInitial) {
          return categorieIs(context, color1, color2, color3, color4, color5,
              color6, colortranst, Colors.transparent);
        } else if (state is CategorieState1) {
          return categorieIs(
              context,
              state.color1,
              state.color2,
              state.color3,
              state.color4,
              state.color5,
              state.color6,
              colortranst,
              greenColor);
        } else if (state is CategorieState2) {
          return categorieIs(
              context,
              state.color1,
              state.color2,
              state.color3,
              state.color4,
              state.color5,
              state.color6,
              colortranst,
              greenColor);
        } else if (state is CategorieState3) {
          return categorieIs(
              context,
              state.color1,
              state.color2,
              state.color3,
              state.color4,
              state.color5,
              state.color6,
              colortranst,
              greenColor);
        } else if (state is CategorieState4) {
          return categorieIs(
              context,
              state.color1,
              state.color2,
              state.color3,
              state.color4,
              state.color5,
              state.color6,
              colortranst,
              greenColor);
        } else if (state is CategorieState5) {
          return categorieIs(
              context,
              state.color1,
              state.color2,
              state.color3,
              state.color4,
              state.color5,
              state.color6,
              colortranst,
              greenColor);
        } else if (state is CategorieState6) {
          return categorieIs(
              context,
              state.color1,
              state.color2,
              state.color3,
              state.color4,
              state.color5,
              state.color6,
              colortranst,
              greenColor);
        }
        return categorieIs(context, color1, color2, color3, color4, color5,
            color6, colortranst, Colors.transparent);
      },
    );
  }
}
