import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../models/article_model.dart';

List<ArticleModel> documents = [];

abstract class ArticlesRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getallArticles();
  Future<List<ArticleModel>> getmesArticles();
  Future<Unit> updateArticle(Article article);
  Future<Unit> addArticle(Article article);
  Future<Unit> delletArticle(String id);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Future<Unit> addArticle(Article article) async {
    try {
      await _firestore.collection('Articles').add({
        'email': _auth!.email,
      });
      await _firestore
          .collection('Articles')
          .doc(_auth!.email)
          .collection(_auth!.uid)
          .add({
        'id': article.id,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
      });
      return unit;
    } catch (error) {
      print('$error');
      return unit;
    }
  }

  @override
  Future<Unit> delletArticle(String id) async {
    await _firestore
        .collection('Articles')
        .doc(_auth!.email)
        .collection(_auth!.uid)
        .doc(id)
        .delete();
    return unit; // Utilisez "unit" ici au lieu de "Future.value(unit)"
  }

  @override
  Future<List<ArticleModel>> getmesArticles() async {
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
  Stream<QuerySnapshot<Map<String, dynamic>>> getallArticles() {
    return FirebaseFirestore.instance.collection(_auth!.email!).snapshots();
  }
}
//  QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collectionGroup('Articles').get();
//     final usersId = snapshot.docs.map((e) {
//       return e.id;
//     });

//     for (var uid in usersId) {
//       final x = await FirebaseFirestore.instance
//           .collection('khalid')
//           .doc(uid)
//           .collection(uid)
//           .get();

//       documents.addAll(x.docs.map((collections) {
//         final data = collections.data();
//         final userid = collections.id;
//         return ArticleModel(
//           name: data['name'],
//           article: data['article'],
//           id: userid,
//           prix: data['prix'],
//         );
//       }).toList());
//     }