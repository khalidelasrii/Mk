part of 'drawer_data_cubit.dart';

sealed class DrawerDataState extends Equatable {
  const DrawerDataState();

  @override
  List<Object> get props => [];
}

final class DrawerDataInitial extends DrawerDataState {}

class ShoppingDrawerPageState extends DrawerDataState {
  final List<Article> articles;
  const ShoppingDrawerPageState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ShoppingDataState extends DrawerDataState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> articles;
  const ShoppingDataState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class SearchDrawerState extends DrawerDataState {}

class ProfileDrawerState extends DrawerDataState {}
