part of 'get_mes_article_cubit.dart';

sealed class GetMesArticleState extends Equatable {
  const GetMesArticleState();

  @override
  List<Object> get props => [];
}

final class GetMesArticleInitial extends GetMesArticleState {}

class LodidArticleState extends GetMesArticleState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> articles;
  const LodidArticleState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ErrorProfileState extends GetMesArticleState {
  final String message;
  const ErrorProfileState({required this.message});

  @override
  List<Object> get props => [message];
}
