import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

class WelcomeArticleModel extends WelcomeArticle {
  const WelcomeArticleModel(
      {required super.typearticle,
      required super.name,
      required super.prixArticle,
      required super.articleId});

  factory WelcomeArticleModel.fromeMap(Map<String, dynamic> map) {
    return WelcomeArticleModel(
        typearticle: map['typearticle'] ?? 0,
        name: map['name'] ?? '',
        prixArticle: map['prixArticle'] ?? '',
        articleId: map['articleId'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'typearticle': typearticle,
      'name': name,
      'prixArticle': prixArticle,
      'articleId': articleId,
    };
  }
}
