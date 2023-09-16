import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/secondcont/secoundcont_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/all_categorie_boton/widget_boton/container_botons.dart';

secondContainer(BuildContext context) {
  ferstGroupResum(
      Color color1, Color color2, Color color3, Color color4, Color color5) {
    return Column(
      children: [
        ContainerBotons().secoundContainerBotonFerstGroup(
            false, 1, 'Ferst Group B1', color1, Colors.white),
        ContainerBotons().secoundContainerBotonFerstGroup(
            false, 2, 'Ferst Group B2', color2, Colors.white),
        ContainerBotons().secoundContainerBotonFerstGroup(
            false, 3, 'Ferst Group B3', color3, Colors.white),
        ContainerBotons().secoundContainerBotonFerstGroup(
            false, 4, 'Ferst Group B4', color4, Colors.white),
        ContainerBotons().secoundContainerBotonFerstGroup(
            false, 5, 'Ferst Group B5', color5, Colors.white)
      ],
    );
  }

  secoundGroupResume(
      Color color1, Color color2, Color color3, Color color4, Color color5) {
    return Column(
      children: [
        ContainerBotons().secoundContainerBotonSecoundGroup(
            false, 1, 'Secound Group B1', color1, Colors.white),
        ContainerBotons().secoundContainerBotonSecoundGroup(
            false, 2, 'Secound Group B2', color2, Colors.white),
        ContainerBotons().secoundContainerBotonSecoundGroup(
            false, 3, 'Secound Group B3', color3, Colors.white),
        ContainerBotons().secoundContainerBotonSecoundGroup(
            false, 4, 'Secound Group B4', color4, Colors.white),
        ContainerBotons().secoundContainerBotonSecoundGroup(
            false, 5, 'Secound Group B5', color5, Colors.white)
      ],
    );
  }

  thertGroupResume(
      Color color1, Color color2, Color color3, Color color4, Color color5) {
    return Column(
      children: [
        ContainerBotons().secoundContainerBotonThertGroup(
            false, 1, 'Thert Group B1', color1, Colors.white),
        ContainerBotons().secoundContainerBotonThertGroup(
            false, 2, 'Thert Group B2', color2, Colors.white),
        ContainerBotons().secoundContainerBotonThertGroup(
            false, 3, 'Thert Group B3', color3, Colors.white),
        ContainerBotons().secoundContainerBotonThertGroup(
            false, 4, 'Thert Group B4', color4, Colors.white),
        ContainerBotons().secoundContainerBotonThertGroup(
            false, 5, 'Thert Group B5', color5, Colors.white)
      ],
    );
  }

  forthGroupResume(
      Color color1, Color color2, Color color3, Color color4, Color color5) {
    return Column(
      children: [
        ContainerBotons().secoundContainerBotonForthGroup(
            false, 1, 'Forth Group B1', color1, Colors.white),
        ContainerBotons().secoundContainerBotonForthGroup(
            false, 2, 'Forth Group B2', color2, Colors.white),
        ContainerBotons().secoundContainerBotonForthGroup(
            false, 3, 'Forth Group B3', color3, Colors.white),
        ContainerBotons().secoundContainerBotonForthGroup(
            false, 4, 'Forth Group B4', color4, Colors.white),
        ContainerBotons().secoundContainerBotonForthGroup(
            false, 5, 'Forth Group B5', color5, Colors.white)
      ],
    );
  }

  fiftGroupResume(
      Color color1, Color color2, Color color3, Color color4, Color color5) {
    return Column(
      children: [
        ContainerBotons().secoundContainerBotonFiftGroup(
            false, 1, 'Fifth Group B1', color1, Colors.white),
        ContainerBotons().secoundContainerBotonFiftGroup(
            false, 2, 'Fifth Group B2', color2, Colors.white),
        ContainerBotons().secoundContainerBotonFiftGroup(
            false, 3, 'Fifth Group B3', color3, Colors.white),
        ContainerBotons().secoundContainerBotonFiftGroup(
            false, 4, 'Fifth Group B4', color4, Colors.white),
        ContainerBotons().secoundContainerBotonFiftGroup(
            false, 5, 'Fifth Group B5', color5, Colors.white)
      ],
    );
  }

  return Expanded(
    child: MouseRegion(
      onEnter: (_) {},
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        color: Colors.red,
        height: double.infinity,
        child: BlocBuilder<SecoundcontCubit, SecoundcontState>(
          builder: (context, state) {
            if (state is SecoundcontInitial) {
              const trans = Colors.transparent;
              return ferstGroupResum(Colors.amber, trans, trans, trans, trans);
            } else if (state is SecoundState1) {
              return ferstGroupResum(state.color1, state.color2, state.color3,
                  state.color4, state.color5);
            } else if (state is SecoundState2) {
              return secoundGroupResume(state.color1, state.color2,
                  state.color3, state.color4, state.color5);
            } else if (state is SecoundState3) {
              return thertGroupResume(state.color1, state.color2, state.color3,
                  state.color4, state.color5);
            } else if (state is SecoundState4) {
              return forthGroupResume(state.color1, state.color2, state.color3,
                  state.color4, state.color5);
            } else if (state is SecoundState5) {
              return fiftGroupResume(state.color1, state.color2, state.color3,
                  state.color4, state.color5);
            }
            return const SizedBox();
          },
        ),
      ),
    ),
  );
}
