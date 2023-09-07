import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../models/article_model.dart';

abstract class ArticlesRemoteDataSource {
  Future<List<Article>> getallArticles();
  Future<List<ArticleModel>> getmesArticles();
  Future<Unit> updateArticle(Article article);
  Future<String> addArticle(Article article);
  Future<Unit> delletArticle(String collectionId, String id);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<String> addArticle(Article article) async {
    try {
      // Récupérer l'ID de l'utilisateur (vous devez avoir un moyen de l'obtenir)
      final String userId =
          _auth!.email!; // Changez cela pour obtenir l'ID de l'utilisateur

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
      await _firestore.collection('Articles').doc(userId).set({
        'email': userId,
      });

      await _firestore
          .collection('Articles')
          .doc(userId)
          .collection(userId)
          .add({
        'id': uniqueImageId,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': imageUrl,
      });

      return imageUrl;
    } catch (error) {
      return '';
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
  Future<List<ArticleModel>> getmesArticles() async {
    final querysnapshot = await _firestore
        .collection('Articles')
        .doc(_auth!.email)
        .collection(_auth!.uid)
        .get();

    return querysnapshot.docs.map((alluser) {
      final data = alluser.data();
      final usrid = alluser.id;

      return ArticleModel(
        email: data['email'],
        id: usrid,
        name: data['name'],
        prix: data['prix'],
        article: data['article'],
      );
    }).toList();
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
  Future<List<Article>> getallArticles() async {
    final articlesCollection = _firestore.collection('Articles');
    List<Article> allArticles = [];

    try {
      QuerySnapshot snapshot = await articlesCollection.get();

      for (QueryDocumentSnapshot documentSnapshot in snapshot.docs) {
        final articleId = documentSnapshot.id;

        final subCollectionSnapshot =
            await articlesCollection.doc(articleId).collection(articleId).get();

        final subCollectionArticles = subCollectionSnapshot.docs.map((subDoc) {
          final subArticleData = subDoc.data();

          return Article(
              email: subArticleData['email'],
              article: subArticleData['article'],
              name: subArticleData['name'],
              prix: subArticleData['prix'],
              id: subDoc.id,
              articleUrl: subArticleData['articleUrl']);
        }).toList();

        allArticles.addAll(subCollectionArticles);
      }

      return allArticles;
    } catch (e) {
      return [];
    }
  }
}
