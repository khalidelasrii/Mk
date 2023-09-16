import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/toolbar_Cuibit/toolbar_cubit.dart';

import 'all_categorie_boton/pere_container-all_categorie.dart';

class ContainerAllCategorie {
  containerAllCategorie() {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is CategorieState1) {
          return sousListeCategorie(context, 1, Colors.amber);
        } else if (state is CategorieState2) {
          return sousListeCategorie(context, 2, Colors.red);
        } else if (state is CategorieState3) {
          return sousListeCategorie(context, 3, Colors.green);
        } else if (state is CategorieState4) {
          return sousListeCategorie(context, 4, Colors.blue);
        } else if (state is CategorieState5) {
          return sousListeCategorie(context, 5, Colors.pink);
        } else if (state is CategorieState6) {
          return sousListeCategorie(context, 6, Colors.deepOrange);
        }
        return const SizedBox();
      },
    );
  }
}
//! seullment pour le temps

