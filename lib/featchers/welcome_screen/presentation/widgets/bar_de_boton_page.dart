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
Color textColor = Colors.white;
Color greenColor = Colors.indigo;

class BarDeBotonPage extends StatelessWidget {
  const BarDeBotonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is CategorieState1) {
          return CategorieIs(
            c1: state.color1,
            c2: state.color2,
            c3: state.color3,
            c4: state.color4,
            c5: state.color5,
            c6: state.color6,
            tran: textColor,
            contaiColor: greenColor,
          );
        } else if (state is CategorieState2) {
          return CategorieIs(
            c1: state.color1,
            c2: state.color2,
            c3: state.color3,
            c4: state.color4,
            c5: state.color5,
            c6: state.color6,
            tran: textColor,
            contaiColor: greenColor,
          );
        } else if (state is CategorieState3) {
          return CategorieIs(
            c1: state.color1,
            c2: state.color2,
            c3: state.color3,
            c4: state.color4,
            c5: state.color5,
            c6: state.color6,
            tran: textColor,
            contaiColor: greenColor,
          );
        } else if (state is CategorieState4) {
          return CategorieIs(
            c1: state.color1,
            c2: state.color2,
            c3: state.color3,
            c4: state.color4,
            c5: state.color5,
            c6: state.color6,
            tran: textColor,
            contaiColor: greenColor,
          );
        } else if (state is CategorieState5) {
          return CategorieIs(
            c1: state.color1,
            c2: state.color2,
            c3: state.color3,
            c4: state.color4,
            c5: state.color5,
            c6: state.color6,
            tran: textColor,
            contaiColor: greenColor,
          );
        } else if (state is CategorieState6) {
          return CategorieIs(
            c1: state.color1,
            c2: state.color2,
            c3: state.color3,
            c4: state.color4,
            c5: state.color5,
            c6: state.color6,
            tran: textColor,
            contaiColor: greenColor,
          );
        } else {
          return CategorieIs(
            c1: color1,
            c2: color2,
            c3: color3,
            c4: color4,
            c5: color5,
            c6: color6,
            tran: Colors.white,
            contaiColor: Colors.transparent,
          );
        }
      },
    );
  }
}

class CategorieIs extends StatelessWidget {
  const CategorieIs(
      {super.key,
      required this.c1,
      required this.c2,
      required this.c3,
      required this.c4,
      required this.c5,
      required this.c6,
      required this.tran,
      required this.contaiColor});
  final Color c1, c2, c3, c4, c5, c6, tran, contaiColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: contaiColor,
      width: double.infinity,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarBotonsAllPages(
                  bontonNembr: 1,
                  botonColor: c1,
                  textColor: tran,
                  textBoton: 'All Categorie',
                ),
                BarBotonsAllPages(
                    bontonNembr: 2,
                    botonColor: c2,
                    textColor: tran,
                    textBoton: ' option 1'),
                BarBotonsAllPages(
                    bontonNembr: 3,
                    botonColor: c3,
                    textColor: tran,
                    textBoton: ' option 2'),
                const SizedBox(
                  width: 20,
                ),
                BarBotonsAllPages(
                    bontonNembr: 4,
                    botonColor: c4,
                    textColor: tran,
                    textBoton: ' option 3'),
                BarBotonsAllPages(
                    bontonNembr: 5,
                    botonColor: c5,
                    textColor: tran,
                    textBoton: ' option 4'),
                BarBotonsAllPages(
                    bontonNembr: 6,
                    botonColor: c6,
                    textColor: tran,
                    textBoton: ' option 5'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
