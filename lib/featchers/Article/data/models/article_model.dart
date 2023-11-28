import 'package:mk/featchers/Article/domain/entitie/article.dart';

class ArticleModel extends Article {
  const ArticleModel(
      {required super.uid,
      required super.articleType,
      required super.email,
      required super.article,
      required super.name,
      required super.prix,
      required super.articleId});

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      uid: map['uid'],
      articleType: map['articleType'] ?? '',
      email: map['email'] ?? '',
      articleId: map['articleId'] ?? '',
      article: map['article'] ?? '',
      name: map['name'] ?? '',
      prix: map['prix'] ?? 0.0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      'articleId': articleId,
      'article': article,
      'name': name,
      'prix': prix,
      'email': email,
    };
  }
}
