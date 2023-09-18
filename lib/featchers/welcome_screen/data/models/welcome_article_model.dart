import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

class WelcomeArticleModel extends WelcomeArticle {
  const WelcomeArticleModel({
    required super.email,
    required super.typearticle,
    required super.name,
    required super.prixArticle,
    required super.article,
    required super.id,
    required super.imageUrl,
  });

  factory WelcomeArticleModel.fromeMap(Map<String, dynamic> map) {
    return WelcomeArticleModel(
      email: map['email'],
      typearticle: map['typearticle'] ?? 0,
      name: map['name'] ?? '',
      prixArticle: map['prix'] ?? '',
      article: map['article'] ?? '',
      id: map['id'] ?? '',
      imageUrl: map['articleUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'typearticle': typearticle,
      'name': name,
      'prixArticle': prixArticle,
      'articleId': article,
    };
  }
}
