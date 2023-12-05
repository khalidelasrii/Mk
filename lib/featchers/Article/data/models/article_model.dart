import 'package:mk/featchers/Article/domain/entitie/article.dart';

class ArticleModel extends Article {
  const ArticleModel(
      {required super.uid,
      required super.articleType,
      required super.email,
      required super.name,
      required super.prix,
      required super.article,
      required super.articleId,
      required super.articleUrl,
      super.date,
      super.likers});

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
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
      'date': date,
      "likers": likers,
    };
  }
}
