import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ArticlesRemoteDataSource {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllArticles();
  Future<Stream<QuerySnapshot<Map>>> getAllArticlestype(String type);
  Future<Unit> updateArticle(Article article);
  Future<Unit> addArticle(Article article);
  Future<Unit> delletArticle(String collectiontype, String id);
  Future<Unit> addoorableArticle(Article article);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Future<Unit> addArticle(Article article) async {
    try {
      final messageid = Timestamp.now();

      final String userId = _auth!.uid;

      // Créez un ID unique pour le fichier image
      String uniqueImageId =
          userId + DateTime.now().millisecondsSinceEpoch.toString();

      Reference userFolderRef =
          FirebaseStorage.instance.ref().child('user_images/$userId');

      Reference imageRef = userFolderRef.child('$uniqueImageId.jpg');

      final metadata = SettableMetadata(contentType: 'image/jpeg');

      await imageRef.putData(article.selectedImageInBytes!, metadata);

      String imageUrl = await imageRef.getDownloadURL();

      // Enregistrez les informations de l'image dans la base de données Firestore

      await _firestore
          .collection('Articles')
          .doc(_auth!.uid)
          .collection(article.type)
          .doc(uniqueImageId)
          .set({
        "userId": _auth!.uid,
        "id": uniqueImageId,
        'type': article.type,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": messageid,
      });
      await _firestore
          .collection('Articles')
          .doc(_auth!.uid)
          .collection("AllCategorie")
          .doc(uniqueImageId)
          .set({
        "userId": _auth!.uid,
        "id": uniqueImageId,
        'type': article.type,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": messageid,
      });
      await _firestore.collection('Searche').doc(uniqueImageId).set({
        "userId": _auth!.uid,
        "id": uniqueImageId,
        'type': article.type,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": messageid,
      });

      await _firestore
          .collection('Searche')
          .doc(article.type)
          .collection(article.type)
          .doc(uniqueImageId)
          .set({
        "userId": _auth!.uid,
        "id": uniqueImageId,
        'type': article.type,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": messageid,
      });

      return unit;
    } catch (error) {
      return unit;
    }
  }

  @override
  Future<Unit> delletArticle(String typeArticle, String id) async {
    await _firestore.collection('Articles').doc(id).delete();
    await _firestore
        .collection('Articles')
        .doc(_auth!.uid)
        .collection(typeArticle)
        .doc(id)
        .delete();
    await _firestore
        .collection('Articles')
        .doc(_auth!.uid)
        .collection("AllCategorie")
        .doc(id)
        .delete();
    await _firestore
        .collection('Searche')
        .doc(typeArticle)
        .collection(typeArticle)
        .doc(id)
        .delete();

    await _firestore.collection('Searche').doc(id).delete();

    return unit; // Utilisez "unit" ici au lieu de "Future.value(unit)"
  }

  @override
  Future<Unit> updateArticle(Article article) async {
    await _firestore
        .collection('Articles')
        .doc(_auth!.uid)
        .collection(article.type)
        .doc(article.id)
        .set({
      "userId": _auth!.uid,
      "id": article.id,
      'type': article.type,
      'article': article.article,
      'name': article.name,
      'prix': article.prix,
      'email': _auth!.email,
      'articleUrl': article.articleUrl,
    });
    await _firestore.collection('Searche').doc(article.id).set({
      "userId": _auth!.uid,
      "id": article.id,
      'type': article.type,
      'article': article.article,
      'name': article.name,
      'prix': article.prix,
      'email': _auth!.email,
      'articleUrl': article.articleUrl,
    });
    await _firestore
        .collection('Searche')
        .doc(article.type)
        .collection(article.type)
        .doc(article.id)
        .set({
      "userId": _auth!.uid,
      "id": article.id,
      'type': article.type,
      'article': article.article,
      'name': article.name,
      'prix': article.prix,
      'email': _auth!.email,
      'articleUrl': article.articleUrl,
    });
    return unit;
  }

  @override
  Future<Stream<QuerySnapshot<Map>>> getAllArticlestype(String type) async {
    return _firestore
        .collection('Searche')
        .doc(type)
        .collection(type)
        .orderBy("date", descending: true)
        .snapshots();
  }

  @override
  Future<Unit> addoorableArticle(Article article) async {
    try {
      await _firestore.collection('ArticleSherché').doc(article.id).set({
        'userId': article.userId,
        'id': article.id,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': article.articleUrl,
        'date': article.date
      });

      return Future.value(unit);
    } catch (e) {
      return Future.value(unit);
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllArticles() async {
    return _firestore
        .collection('Searche')
        .orderBy("date", descending: true)
        .snapshots();
  }
}
