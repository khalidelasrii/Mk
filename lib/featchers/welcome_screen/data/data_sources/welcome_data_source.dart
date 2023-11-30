import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/welcome_screen/data/models/welcome_article_model.dart';

import '../../../Profile/domaine/entitie/profile_user.dart';
import '../../domain/entitie/welcome_article.dart';

abstract class WelcomeDataSource {
  Future<List<WelcomeArticleModel>> getAllArticle();
  Future<List<WelcomeArticleModel>> articlePartype(String type);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> searchResults(
      String query);
  Future<List<ProfileUser>> getUsers();
  Future<List<WelcomeArticle>> shopArticleWalet();
}

class WelcomeDataSourcesImpl implements WelcomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> searchResults(
      String query) async {
    return FirebaseFirestore.instance
        .collection('Searche')
        .where('article', isGreaterThanOrEqualTo: query)
        .snapshots();
  }

  @override
  Future<List<WelcomeArticleModel>> getAllArticle() async {
    final allarticle = await _firestore.collection('Searche').get();
    return allarticle.docs.map((sub) {
      final subArticleData = sub.data();
      return WelcomeArticleModel(
          uid: subArticleData['uid'] ?? "",
          articleType: subArticleData['articleType'],
          email: subArticleData['email'],
          article: subArticleData['article'],
          name: subArticleData['name'],
          prix: subArticleData['prix'],
          articleId: sub.id,
          articleUrl: subArticleData['articleUrl']);
    }).toList();
  }

  @override
  Future<List<WelcomeArticleModel>> articlePartype(String type) async {
    final articles = await _firestore
        .collection('Searche')
        .doc(type)
        .collection(type)
        .orderBy("date", descending: true)
        .get();

    return articles.docs.map((sub) {
      final subArticleData = sub.data();
      return WelcomeArticleModel(
          uid: subArticleData['uid'] ?? "",
          articleType: subArticleData['articleType'],
          email: subArticleData['email'],
          article: subArticleData['article'],
          name: subArticleData['name'],
          prix: subArticleData['prix'],
          articleId: sub.id,
          articleUrl: subArticleData['articleUrl']);
    }).toList();
  }

  @override
  Future<List<ProfileUser>> getUsers() async {
    final user = await _firestore.collection("Users").get();

    return user.docs.map((sub) {
      final subData = sub.data();
      return ProfileUser(
        email: subData["email"],
        name: subData["name"],
        uid: sub.id,
        adress: subData["adress"],
        phoneNumber: subData["phoneNumber"],
        profileUrl: subData["profile"],
        payes: subData["payes"],
      );
    }).toList();
  }

  @override
  Future<List<WelcomeArticle>> shopArticleWalet() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final articles = await _firestore
        .doc(auth.currentUser!.uid)
        .collection("Users")
        .doc(auth.currentUser!.email)
        .collection("Articles")
        .get();
    return articles.docs.map((sub) {
      final subArticleData = sub.data();
      return WelcomeArticleModel(
          uid: subArticleData['uid'] ?? "",
          articleType: subArticleData['articleType'],
          email: subArticleData['email'],
          article: subArticleData['article'],
          name: subArticleData['name'],
          prix: subArticleData['prix'],
          articleId: sub.id,
          articleUrl: subArticleData['articleUrl']);
    }).toList();
  }
}
