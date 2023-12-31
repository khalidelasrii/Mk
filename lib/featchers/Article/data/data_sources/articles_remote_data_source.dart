import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../models/article_model.dart';

abstract class ArticlesRemoteDataSource {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllArticles();
  Future<Stream<QuerySnapshot<Map>>> getArticlesPartype(String type);
  Future<Unit> updateArticle(Article article);
  Future<Unit> addArticle(Article article);
  Future<Unit> delletArticle(String collectiontype, String id);
  Future<Unit> addoorableArticle(Article article);
  Future<void> addArticleInWalet(ArticleModel article);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> shopArticleWalet();
  Future<void> addLiketoArticle(Article article);
  Future<List<Article>> getShopArticleWalet();
  Future<void> delletShopArticleWalet(String id);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Future<Unit> addArticle(Article article) async {
    try {
      final dateTiming = Timestamp.now();
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
//! add article for usr of categorie
      await _firestore
          .collection('Articles')
          .doc(_auth!.uid)
          .collection(article.articleType)
          .doc(uniqueImageId)
          .set({
        "uid": _auth!.uid,
        "articleId": uniqueImageId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": dateTiming,
        "likers": article.likers,
      });
//! add article all Categorie
      await _firestore
          .collection('Articles')
          .doc(_auth!.uid)
          .collection("AllCategorie")
          .doc(uniqueImageId)
          .set({
        "uid": _auth!.uid,
        "articleId": uniqueImageId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": dateTiming,
        "likers": article.likers,
      });
      //! add article for all users
      await _firestore.collection('Searche').doc(uniqueImageId).set({
        "uid": _auth!.uid,
        "articleId": uniqueImageId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": dateTiming,
        "likers": article.likers,
      });
//! add article for all users users  of categorie
      await _firestore
          .collection('Searche')
          .doc(article.articleType)
          .collection(article.articleType)
          .doc(uniqueImageId)
          .set({
        "uid": _auth!.uid,
        "articleId": uniqueImageId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': imageUrl,
        "date": dateTiming,
        "likers": article.likers,
      });

      return unit;
    } catch (error) {
      return unit;
    }
  }

  @override
  Future<Unit> delletArticle(String typeArticle, String id) async {
    try {
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
    } catch (e) {
      print(e);
    }

    return unit; // Utilisez "unit" ici au lieu de "Future.value(unit)"
  }

  @override
  Future<Unit> updateArticle(Article article) async {
    try {
      //! update  Article in user walet

      await _firestore
          .collection('Articles')
          .doc(_auth!.uid)
          .collection(article.articleType)
          .doc(article.articleId)
          .set({
        "uid": _auth!.uid,
        "articleId": article.articleId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': article.articleUrl,
        "likers": article.likers,
        "date": article.date,
      });

      //! update  All Categorie of article
      await _firestore.collection('Searche').doc(article.articleId).set({
        "uid": _auth!.uid,
        "articleId": article.articleId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': article.articleUrl,
        "likers": article.likers,
        "date": article.date,
      });
      //! update   article par categorie

      await _firestore
          .collection('Searche')
          .doc(article.articleType)
          .collection(article.articleType)
          .doc(article.articleId)
          .set({
        "uid": _auth!.uid,
        "articleId": article.articleId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': article.articleUrl,
        "likers": article.likers,
        "date": article.date,
      });
      return unit;
    } catch (e) {
      return unit;
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map>>> getArticlesPartype(String type) async {
    try {
      return _firestore
          .collection('Searche')
          .doc(type)
          .collection(type)
          .orderBy("date", descending: true)
          .snapshots();
    } catch (e) {
      return Stream.error(e);
    }
  }

  @override
  Future<Unit> addoorableArticle(Article article) async {
    try {
      await _firestore.collection('ArticleSherché').doc(article.articleId).set({
        "articleType": article.articleType,
        'uid': article.uid,
        'articleId': article.articleId,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': article.articleUrl,
        'date': article.date,
        "likers": article.likers,
      });

      return Future.value(unit);
    } catch (e) {
      return Future.value(unit);
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllArticles() async {
    try {
      return _firestore
          .collection('Searche')
          .orderBy("date", descending: true)
          .snapshots();
    } catch (e) {
      return Stream.error(e);
    }
  }

  @override
  Future<void> addLiketoArticle(Article article) async {
    try {
      //! add article for all users users  of categorie
      await _firestore.collection('Searche').doc(article.articleId).set({
        "articleType": article.articleType,
        'uid': article.uid,
        'articleId': article.articleId,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': article.articleUrl,
        'date': article.date,
        "likers": article.likers
      });
      //! add article for all users users  of categorie

      await _firestore
          .collection('Searche')
          .doc(article.articleType)
          .collection(article.articleType)
          .doc(article.articleId)
          .set({
        "articleType": article.articleType,
        'uid': article.uid,
        'articleId': article.articleId,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': article.articleUrl,
        'date': article.date,
        "likers": article.likers
      });

      await _firestore
          .collection('Articles')
          .doc(article.uid)
          .collection("AllCategorie")
          .doc(article.articleId)
          .set({
        "uid": article.uid,
        "articleId": article.articleId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
        'articleUrl': article.articleUrl,
        "date": article.date,
        "likers": article.likers,
      });

      await _firestore
          .collection('Articles')
          .doc(article.uid)
          .collection(article.articleType)
          .doc(article.articleId)
          .set({
        "uid": article.uid,
        "articleId": article.articleId,
        'articleType': article.articleType,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': _auth!.email,
        'articleUrl': article.articleUrl,
        "date": article.date,
        "likers": article.likers,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> addArticleInWalet(ArticleModel article) async {
    try {
      await _firestore
          .collection("Users")
          .doc(_auth!.uid)
          .collection("Articles")
          .doc(article.articleId)
          .set(article.toMap());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> shopArticleWalet() async {
    try {
      return _firestore
          .collection("Users")
          .doc(_auth!.uid)
          .collection("Articles")
          .snapshots();
    } catch (e) {
      return Stream.error(0);
    }
  }

  @override
  Future<List<Article>> getShopArticleWalet() async {
    try {
      final articles = await _firestore
          .collection("Users")
          .doc(_auth!.uid)
          .collection("Articles")
          .get();
      return articles.docs.map((sub) {
        final subArticleData = sub.data();
        return Article(
            uid: subArticleData['uid'],
            articleType: subArticleData['articleType'],
            email: subArticleData['email'],
            article: subArticleData['article'],
            name: subArticleData['name'],
            prix: subArticleData['prix'],
            articleId: sub.id,
            articleUrl: subArticleData['articleUrl'],
            date: subArticleData['date'],
            likers: subArticleData['likers']);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> delletShopArticleWalet(String articleId) async {
    try {
      await _firestore
          .collection("Users")
          .doc(_auth!.uid)
          .collection("Articles")
          .doc(articleId)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
