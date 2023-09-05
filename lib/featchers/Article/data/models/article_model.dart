import 'package:mk/featchers/Article/domain/entitie/article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {super.selectedImageInBytes,
      required super.email,
      required super.article,
      required super.name,
      required super.prix,
      required super.id});

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      email: map['email'] ?? '',
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
      'email': email,
    };
  }
}
