import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'categoriercheld2_state.dart';

class Categoriercheldren2Cubit extends Cubit<Categoriercheld2State> {
  Categoriercheldren2Cubit() : super(Categoriercheld2Initial());
  Color amberColor = Colors.amber;
  Color transparenColor = Colors.transparent;
  ferstCategorieEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(CategorieChidl2State1(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(CategorieChidl2State2(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(CategorieChidl2State3(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(CategorieChidl2State4(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(CategorieChidl2State5(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(CategorieChidl2State6(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }
}
