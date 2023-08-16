import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';

abstract class ArticlesRemoteDataSource {
  Future<List<Article>> getArticles();
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
  Future<List<Article>> getArticles() async {
    final querySnapshot = await _firestore.collection('Articles').get();
    final articles = querySnapshot.docs.map((doc) {
      final data = doc.data();
      final articleId = doc.id; // Get the document ID
      return Article(
        id: articleId,
        article: data['article'], // Replace with your field names
        name: data['name'],
        prix: data['prix'].toDouble(),
      );
    }).toList();
    return articles; // Return the list of articles
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
