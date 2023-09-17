import 'package:equatable/equatable.dart';

class WelcomeArticle extends Equatable {
  final int typearticle;
  final String name;
  final String prixArticle;
  final String articleId;

  const WelcomeArticle(
      {required this.typearticle,
      required this.name,
      required this.prixArticle,
      required this.articleId});

  @override
  List<Object?> get props => [typearticle, name, prixArticle, articleId];
}
