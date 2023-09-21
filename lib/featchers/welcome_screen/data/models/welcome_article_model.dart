import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

class WelcomeArticleModel extends WelcomeArticle {
  const WelcomeArticleModel({
    required super.type,
    required super.email,
    required super.name,
    required super.prixArticle,
    required super.article,
    required super.id,
    required super.imageUrl,
  });

  factory WelcomeArticleModel.fromeMap(Map<String, dynamic> map) {
    return WelcomeArticleModel(
      type: map['type'],
      email: map['email'],
      name: map['name'] ?? '',
      prixArticle: map['prix'] ?? '',
      article: map['article'] ?? '',
      id: map['id'] ?? '',
      imageUrl: map['articleUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'prixArticle': prixArticle,
      'articleId': article,
    };
  }
}
