import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import '../widget_boton/container_botons.dart';

ferstContainer() {
  fonctionResum(Color color1, Color color2, Color color3, Color color4,
      Color color5, Color transpa) {
    const Color whiteColor = Colors.white;
    return SingleChildScrollView(
      child: Column(children: [
        ContainerBotons()
            .ferstContainerBoton(false, 1, 'group1b1', color1, whiteColor),
        ContainerBotons()
            .ferstContainerBoton(false, 2, 'group1b2', color2, whiteColor),
        ContainerBotons()
            .ferstContainerBoton(false, 3, 'group1b3', color3, whiteColor),
        ContainerBotons()
            .ferstContainerBoton(false, 4, 'group1b4', color4, whiteColor),
        ContainerBotons()
            .ferstContainerBoton(false, 5, 'group1b5', color5, whiteColor)
      ]),
    );
  }

  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      height: double.infinity,
      child: BlocBuilder<CategoriecheldrenCubit, CategoriecheldrenState>(
        builder: (context, state) {
          if (state is CategoriecheldrenInitial) {
            const Color trnaspacolor = Colors.transparent;
            return fonctionResum(Colors.amber, trnaspacolor, trnaspacolor,
                trnaspacolor, trnaspacolor, trnaspacolor);
          } else if (state is CategorieChidlState1) {
            return fonctionResum(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          }
          return fonctionResum(Colors.red, Colors.red, Colors.red, Colors.red,
              Colors.red, Colors.red);
        },
      ),
    ),
  );
}
