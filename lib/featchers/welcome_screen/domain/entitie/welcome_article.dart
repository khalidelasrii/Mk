import 'package:mk/featchers/Article/domain/entitie/article.dart';

class WelcomeArticle extends Article {
  const WelcomeArticle(
      {required super.uid,
      required super.articleType,
      required super.email,
      required super.article,
      required super.name,
      required super.prix,
      required super.articleId,
      super.articleUrl,
      super.date});

  @override
  List<Object?> get props => [
        uid,
        articleType,
        email,
        article,
        name,
        prix,
        articleId,
        article,
        articleUrl,
        date
      ];
}
