part of 'get_mes_articles_cubit.dart';

sealed class GetMesArticlesState extends Equatable {
  const GetMesArticlesState();

  @override
  List<Object> get props => [];
}

final class GetMesArticlesInitial extends GetMesArticlesState {}

class LodingMesArticlesState extends GetMesArticlesState {}

class LodidMesArticlesState extends GetMesArticlesState {
  final List<Article> articles;

  const LodidMesArticlesState({required this.articles});
}

class ErrorMesArticlesState extends GetMesArticlesState {}
