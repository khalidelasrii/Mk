part of 'appbafont_cubit.dart';

sealed class AppbafontState extends Equatable {
  const AppbafontState();

  @override
  List<Object> get props => [];
}

final class AppbafontInitial extends AppbafontState {}

class AppbarFontPressedState extends AppbafontState {}
