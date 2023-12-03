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
  Future<void> addArticleInWalet(WelcomeArticleModel article);
}

class WelcomeDataSourcesImpl implements WelcomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    try {
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
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<WelcomeArticleModel>> articlePartype(String type) async {
    try {
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
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<ProfileUser>> getUsers() async {
    final user = await _firestore.collection("Users").get();
    try {
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
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<WelcomeArticle>> shopArticleWalet() async {
    try {
      final articles = await _firestore
          .collection("Users")
          .doc(_auth.currentUser!.uid)
          .collection("Articles")
          .get();
      return articles.docs.map((sub) {
        final subArticleData = sub.data();
        return WelcomeArticleModel(
            uid: subArticleData['uid'],
            articleType: subArticleData['articleType'],
            email: subArticleData['email'],
            article: subArticleData['article'],
            name: subArticleData['name'],
            prix: subArticleData['prix'],
            articleId: sub.id,
            articleUrl: subArticleData['articleUrl']);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addArticleInWalet(WelcomeArticleModel article) async {
    try {
      await _firestore
          .collection("Users")
          .doc(_auth.currentUser!.uid)
          .collection("Articles")
          .doc(article.articleId)
          .set(article.toMap());
    } catch (e) {
      print(e);
    }
  }
}
