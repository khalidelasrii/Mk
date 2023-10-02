import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ArticlesRemoteDataSource {
  Future<List<Article>> getAllArticles();
  Future<Unit> updateArticle(Article article);
  Future<Unit> addArticle(Article article);
  Future<Unit> delletArticle(String collectionId, String id);
  Future<Unit> addoorableArticle(Article article);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  List<String> collectionName = [
    'Forniture',
    'Livres',
    'Cartables',
    'Stylo',
    'Cartables',
    'Autres',
  ];

  @override
  Future<Unit> addArticle(Article article) async {
    try {
      // Récupérer l'ID de l'utilisateur (vous devez avoir un moyen de l'obtenir)
      final String userId =
          article.email; // Changez cela pour obtenir l'ID de l'utilisateur

      // Créez un ID unique pour le fichier image
      String uniqueImageId = DateTime.now().millisecondsSinceEpoch.toString();

      // Créez une référence au dossier de l'utilisateur dans Firebase Storage
      Reference userFolderRef =
          FirebaseStorage.instance.ref().child('user_images/$userId');

      // Créez une référence au fichier image dans le dossier de l'utilisateur
      Reference imageRef = userFolderRef.child('$uniqueImageId.jpg');

      // Définir les métadonnées pour le fichier image
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      // Uploader l'image à l'emplacement spécifié
      await imageRef.putData(article.selectedImageInBytes!, metadata);

      // Obtenir l'URL de téléchargement de l'image téléchargée
      String imageUrl = await imageRef.getDownloadURL();

      // Enregistrez les informations de l'image dans la base de données Firestore

      await _firestore
          .collection('Articles')
          .doc(userId)
          .collection(article.type)
          .add({
        'type': article.type,
        'id': uniqueImageId,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': imageUrl,
      });

      await _firestore.collection('ArticleSearche').doc(uniqueImageId).set({
        'type': article.type,
        'id': uniqueImageId,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': imageUrl,
      });
      await _firestore.collection('Articles').doc(userId).set({
        'email': userId,
      });
      return unit;
    } catch (error) {
      return unit;
    }
  }

  @override
  Future<Unit> delletArticle(String collectionId, String id) async {
    await _firestore
        .collection('Articles')
        .doc(collectionId)
        .collection(collectionId)
        .doc(id)
        .delete();
    return unit; // Utilisez "unit" ici au lieu de "Future.value(unit)"
  }

  @override
  Future<Unit> updateArticle(Article article) async {
    await _firestore
        .collection('Articles')
        .doc(_auth!.email)
        .collection(_auth!.email!)
        .doc(article.id)
        .set({
      'article': article.article,
      'name': article.name,
      'prix': article.prix,
    });
    return unit;
  }

  @override
  Future<List<Article>> getAllArticles() async {
    final articlesCollection = _firestore.collection('ArticleSearche');
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await articlesCollection.get();

    List<Article> subCollectionArticles = snapshot.docs.map((subDoc) {
      Map<String, dynamic> subArticleData = subDoc.data();

      return Article(
          type: subArticleData['type'],
          email: subArticleData['email'],
          article: subArticleData['article'],
          name: subArticleData['name'],
          prix: subArticleData['prix'],
          id: subDoc.id,
          articleUrl: subArticleData['articleUrl']);
    }).toList();

    return subCollectionArticles;
  }

  @override
  Future<Unit> addoorableArticle(Article article) async {
    try {
      await _firestore.collection('ArticleAdor').doc(article.id).set({
        'id': article.id,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': article.articleUrl,
      });

      return Future.value(unit);
    } catch (e) {
      return Future.value(unit);
    }
  }
}
