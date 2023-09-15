part of 'toolbar_cubit.dart';

sealed class ToolbarState extends Equatable {
  const ToolbarState();

  @override
  List<Object> get props => [];
}

final class ToolbarInitial extends ToolbarState {}

class AppbarfesrtState extends ToolbarState {
  final Color color1;
  final Color color2;
  const AppbarfesrtState({required this.color1, required this.color2});
  @override
  List<Object> get props => [color1, color2];
}

class CategorieState1 extends ToolbarState {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieState1(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6});
  @override
  List<Object> get props => [color1, color2, color3, color4, color5, color6];
}

class CategorieState2 extends ToolbarState {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieState2(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6});
  @override
  List<Object> get props => [color1, color2, color3, color4, color5, color6];
}

class CategorieState3 extends ToolbarState {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieState3(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6});
  @override
  List<Object> get props => [color1, color2, color3, color4, color5, color6];
}

class CategorieState4 extends ToolbarState {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieState4(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6});
  @override
  List<Object> get props => [color1, color2, color3, color4, color5, color6];
}

class CategorieState5 extends ToolbarState {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieState5(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6});
  @override
  List<Object> get props => [color1, color2, color3, color4, color5, color6];
}

class CategorieState6 extends ToolbarState {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieState6(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6});
  @override
  List<Object> get props => [color1, color2, color3, color4, color5, color6];
}
