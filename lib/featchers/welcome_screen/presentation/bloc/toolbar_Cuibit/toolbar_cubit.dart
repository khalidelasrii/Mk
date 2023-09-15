import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'toolbar_state.dart';

class ToolbarCubit extends Cubit<ToolbarState> {
  ToolbarCubit() : super(ToolbarInitial());
  static const Color transparent = Colors.transparent;
  static const Color amber = Colors.amber;
  isInitial() {
    emit(ToolbarInitial());
  }

  appbarferstEvent() {
    emit(const AppbarfesrtState(color1: Colors.white, color2: Colors.black));
  }

  categorie1(int isin) {
    if (isin == 1) {
      emit(const CategorieState1(
          color1: amber,
          color2: transparent,
          color3: transparent,
          color4: transparent,
          color5: transparent,
          color6: transparent));
    } else if (isin == 2) {
      emit(const CategorieState2(
          color1: transparent,
          color2: amber,
          color3: transparent,
          color4: transparent,
          color5: transparent,
          color6: transparent));
    } else if (isin == 3) {
      emit(const CategorieState3(
          color1: transparent,
          color2: transparent,
          color3: amber,
          color4: transparent,
          color5: transparent,
          color6: transparent));
    } else if (isin == 4) {
      emit(const CategorieState4(
          color1: transparent,
          color2: transparent,
          color3: transparent,
          color4: amber,
          color5: transparent,
          color6: transparent));
    } else if (isin == 5) {
      emit(const CategorieState5(
          color1: transparent,
          color2: transparent,
          color3: transparent,
          color4: transparent,
          color5: amber,
          color6: transparent));
    } else if (isin == 6) {
      emit(const CategorieState6(
          color1: transparent,
          color2: transparent,
          color3: transparent,
          color4: transparent,
          color5: transparent,
          color6: amber));
    }
  }
}
