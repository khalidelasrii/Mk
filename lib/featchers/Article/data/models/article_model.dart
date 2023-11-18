import 'package:mk/featchers/Article/domain/entitie/article.dart';

class ArticleModel extends Article {
  const ArticleModel(
      {required super.userId,
      required super.type,
      required super.email,
      required super.article,
      required super.name,
      required super.prix,
      required super.id});

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      userId: map['userId'],
      type: map['type'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      article: map['article'] ?? '',
      name: map['name'] ?? '',
      prix: map['prix'] ?? 0.0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      'id': id,
      'article': article,
      'name': name,
      'prix': prix,
      'email': email,
    };
  }
}
