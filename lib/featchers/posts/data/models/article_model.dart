import 'package:mk/featchers/posts/domain/entitie/article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {required super.id,
      required super.article,
      required super.name,
      required super.prix});

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] ?? '',
      article: map['article'] ?? '',
      name: map['name'] ?? '',
      prix: map['prix'] ?? 0.0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'article': article,
      'name': name,
      'prix': prix,
    };
  }
}
