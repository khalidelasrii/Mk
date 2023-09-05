import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../models/article_model.dart';

List<ArticleModel> documents = [];

abstract class ArticlesRemoteDataSource {
  Future<List<Article>> getallArticles();
  Future<List<ArticleModel>> getmesArticles();
  Future<Unit> updateArticle(Article article);
  Future<Unit> addArticle(Article article);
  Future<Unit> delletArticle(String collectionId, String id);
}

class ArticlesFirebase implements ArticlesRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _image;

  @override
  Future<Unit> addArticle(Article article) async {
    try {
      //! ////////////////////////////////
      // This is referance where image uploaded in firebase storage bucket
      Reference ref = FirebaseStorage.instance.ref().child('Images');

      final metadata = SettableMetadata(contentType: 'images/jpeg');

      UploadTask uploadTask =
          ref.putData(article.selectedImageInBytes!, metadata);

      String urlarticle = await ref.getDownloadURL();

      print(urlarticle);
      //! //////////////

      await _firestore.collection('Articles').doc(_auth!.email).set({
        'email': _auth!.email,
      });
      await _firestore
          .collection('Articles')
          .doc(_auth!.email)
          .collection(_auth!.email!)
          .add({
        'id': article.id,
        'article': article.article,
        'name': article.name,
        'prix': article.prix,
        'email': article.email,
      });
      return unit;
    } catch (error) {
      print('$error');
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
          );
        }).toList();

        allArticles.addAll(subCollectionArticles);
      }

      return allArticles;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<String> imageArticle() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        _image = File(image.path);
        String filname = DateTime.now().millisecondsSinceEpoch.toString();
        firebase_storage.Reference ref =
            storage.ref().child('images/${_auth!.email}/{$filname}.jpg');
        await ref.putFile(_image!);
        String downaloadURL = await ref.getDownloadURL();
        return downaloadURL;
      } else {
        return 'images/MK.png';
      }
    } catch (e) {
      return '$e';
    }
  }
}
