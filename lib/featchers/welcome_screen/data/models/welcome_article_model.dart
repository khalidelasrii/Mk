import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

class WelcomeArticleModel extends WelcomeArticle {
  const WelcomeArticleModel({
    required super.uid,
    required super.articleType,
    required super.email,
    required super.name,
    required super.prix,
    required super.article,
    required super.articleId,
    required super.articleUrl,
  });

  factory WelcomeArticleModel.fromeMap(Map<String, dynamic> map) {
    return WelcomeArticleModel(
      uid: map['uid'],
      articleType: map['articleType'],
      email: map['email'],
      name: map['name'] ?? '',
      prix: map['prix'] ?? '',
      article: map['article'] ?? '',
      articleId: map['articleId'] ?? '',
      articleUrl: map['articleUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "uid": uid,
      "articleType": articleType,
      "articleId": articleId,
      "articleUrl": articleUrl,
      'name': name,
      'prix': prix,
      'article': article,
    };
  }
}
