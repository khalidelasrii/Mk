import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../models/article_model.dart';

abstract class ArticlesRemoteDataSource {
  Future<List<ArticleModel>> getArticles();
  Future<Unit> updateArticle(Article article);
  Future<Unit> addArticle(Article article);
  Future<Unit> delletArticle(String id);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> addArticle(Article article) async {
    await _firestore.collection('Articles').add({
      'id': article.id,
      'article': article.article,
      'name': article.name,
      'prix': article.prix,
    });

    return unit;
  }

  @override
  Future<Unit> delletArticle(String id) async {
    await _firestore.collection('Articles').doc(id).delete();
    return unit; // Utilisez "unit" ici au lieu de "Future.value(unit)"
  }

  @override
  Future<List<ArticleModel>> getArticles() async {
    final querysnapshot = await _firestore.collection('Articles').get();

    final users = querysnapshot.docs.map((alluser) {
      final data = alluser.data();
      final usrid = alluser.id;
      return ArticleModel(
        id: usrid,
        name: data['name'],
        prix: data['prix'],
        article: data['article'],
      );
    }).toList();
    return users;
  }

  @override
  Future<Unit> updateArticle(Article article) async {
    await _firestore.collection('Articles').doc(article.id).set({
      'article': article.article,
      'name': article.name,
      'prix': article.prix,
    });
    return unit;
  }
}
