part of 'categoriecheldren_cubit.dart';

sealed class CategoriecheldrenState extends Equatable {
  const CategoriecheldrenState();

  @override
  List<Object> get props => [];
}

final class CategoriecheldrenInitial extends CategoriecheldrenState {}

class CategorieChidlState1 extends CategoriecheldrenState {
  final int groupIs;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CategorieChidlState1(
      {required this.groupIs,
      required this.color3,
      required this.color4,
      required this.color5,
      required this.color6,
      required this.color1,
      required this.color2});

  @override
  List<Object> get props =>
      [color1, color2, color3, color4, color5, color6, groupIs];
}
