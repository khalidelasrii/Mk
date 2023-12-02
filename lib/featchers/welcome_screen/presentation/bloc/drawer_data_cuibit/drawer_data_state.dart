part of 'drawer_data_cubit.dart';

sealed class DrawerDataState extends Equatable {
  const DrawerDataState();

  @override
  List<Object> get props => [];
}

final class DrawerDataInitial extends DrawerDataState {}

class ShoppingDrawerState extends DrawerDataState {
  final List<WelcomeArticle> articles;
  const ShoppingDrawerState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class SearchDrawerState extends DrawerDataState {}

class ProfileDrawerState extends DrawerDataState {}
