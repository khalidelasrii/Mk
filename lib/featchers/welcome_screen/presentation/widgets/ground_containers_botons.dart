import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/toolbar_Cuibit/toolbar_cubit.dart';

import 'all_categorie_boton/pere_container-all_categorie.dart';

class ContainerAllCategorie extends StatelessWidget {
  const ContainerAllCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is CategorieState1) {
          return sousListeCategorie(context, 1, const Color(0x464CAF4F));
        } else if (state is CategorieState2) {
          return Container(
            color: Colors.red,
            height: 300,
            width: double.infinity,
          );
        } else if (state is CategorieState3) {
          return Container(
            color: Colors.purple,
            height: 300,
            width: double.infinity,
          );
        } else if (state is CategorieState4) {
          return Container(
            color: Colors.orange,
            height: 300,
            width: double.infinity,
          );
        } else if (state is CategorieState5) {
          return Container(
            color: Colors.green,
            height: 300,
            width: double.infinity,
          );
        } else if (state is CategorieState6) {
          return Container(
            color: Colors.blue,
            height: 300,
            width: double.infinity,
          );
        }
        return const SizedBox();
      },
    );
  }
}

//! seullment pour le temps

