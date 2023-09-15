import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'categoriecheldren_state.dart';

class CategoriecheldrenCubit extends Cubit<CategoriecheldrenState> {
  CategoriecheldrenCubit() : super(CategoriecheldrenInitial());
  Color amberColor = Colors.amber;
  Color transparenColor = Colors.transparent;

  initialCategorie() {
    emit(CategoriecheldrenInitial());
  }

  ferstCategorieEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(CategorieChidlState1(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(CategorieChidlState2(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(CategorieChidlState3(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(CategorieChidlState4(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(CategorieChidlState5(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(CategorieChidlState6(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }
}
