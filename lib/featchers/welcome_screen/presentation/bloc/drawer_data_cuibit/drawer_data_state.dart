part of 'drawer_data_cubit.dart';

sealed class DrawerDataState extends Equatable {
  const DrawerDataState();

  @override
  List<Object> get props => [];
}

final class DrawerDataInitial extends DrawerDataState {}

class ShoppingDrawerState extends DrawerDataState {}

class SearchDrawerState extends DrawerDataState {}

class ProfileDrawerState extends DrawerDataState {}
