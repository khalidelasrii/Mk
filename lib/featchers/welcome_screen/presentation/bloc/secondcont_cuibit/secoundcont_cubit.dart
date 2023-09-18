import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'secoundcont_state.dart';

class SecoundcontCubit extends Cubit<SecoundcontState> {
  SecoundcontCubit() : super(SecoundcontInitial());
  Color amberColor = Colors.amber;
  Color transparenColor = Colors.transparent;
  isInitialSecound() {
    emit(SecoundcontInitial());
  }

  ferstGroupEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(SecoundState1(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(SecoundState1(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(SecoundState1(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(SecoundState1(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(SecoundState1(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(SecoundState1(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }

  secoundGroupEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(SecoundState2(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(SecoundState2(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(SecoundState2(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(SecoundState2(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(SecoundState2(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(SecoundState2(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }

  thertGroupEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(SecoundState3(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(SecoundState3(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(SecoundState3(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(SecoundState3(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(SecoundState3(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(SecoundState3(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }

  forthGroupEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(SecoundState4(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(SecoundState4(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(SecoundState4(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(SecoundState4(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(SecoundState4(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(SecoundState4(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }

  fiftGroupEvent(int catNumbre) {
    if (catNumbre == 1) {
      emit(SecoundState5(
          color1: amberColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 2) {
      emit(SecoundState5(
        color1: transparenColor,
        color2: amberColor,
        color3: transparenColor,
        color4: transparenColor,
        color5: transparenColor,
        color6: transparenColor,
      ));
    } else if (catNumbre == 3) {
      emit(SecoundState5(
          color1: transparenColor,
          color2: transparenColor,
          color3: amberColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 4) {
      emit(SecoundState5(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: amberColor,
          color5: transparenColor,
          color6: transparenColor));
    } else if (catNumbre == 5) {
      emit(SecoundState5(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: amberColor,
          color6: transparenColor));
    } else if (catNumbre == 6) {
      emit(SecoundState5(
          color1: transparenColor,
          color2: transparenColor,
          color3: transparenColor,
          color4: transparenColor,
          color5: transparenColor,
          color6: amberColor));
    }
  }
}
