import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbafont_state.dart';

class AppbafontCubit extends Cubit<AppbafontState> {
  AppbafontCubit() : super(AppbafontInitial());
  appBarIsExitEvent() {
    emit(AppbafontInitial());
  }

  appBarfontPressedEvent() {
    emit(AppbarFontPressedState());
  }
}
