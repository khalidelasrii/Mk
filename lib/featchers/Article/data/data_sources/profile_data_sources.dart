import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Article/data/models/profileModel.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileDataSources {
  Future<List<Article>> getmesArticles();
  Future<Unit> sendMessage(String message);
  Future<List<ProfileModel>> getMessages();
}

class ProfileDataSourcesImpl implements ProfileDataSources {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  List<String> collectionName = [
    'Forniture',
    'Livres',
    'Cartables',
    'Stylo',
    'Cartables',
    'Autres',
  ];
  final List<Article> articlesList = [];
  @override
  Future<List<Article>> getmesArticles() async {
    for (var collection in collectionName) {
      final querysnapshot = await _firestore
          .collection('Articles')
          .doc(_auth.currentUser!.email)
          .collection(collection)
          .get();
      final xx = querysnapshot.docs.map((alluser) {
        final data = alluser.data();
        final usrid = alluser.id;

        return Article(
            type: data['type'],
            email: data['email'],
            id: usrid,
            name: data['name'],
            prix: data['prix'],
            article: data['article'],
            articleUrl: data['articleUrl']);
      }).toList();
      articlesList.addAll(xx);
    }
    return articlesList;
  }

  @override
  Future<Unit> sendMessage(String profile) async {
    await _firestore.collection("Mesagerie").add({
      "message": profile,
      "email": _auth.currentUser!.email,
    });
    return Future.value(unit);
  }

  @override
  Future<List<ProfileModel>> getMessages() async {
    final messages = await _firestore.collection('Mesagerie').get();
    return messages.docs.map((data) {
      final subData = data.data();

      return ProfileModel(
          email: subData['email'],
          id: subData['messageId'],
          numberPhone: '',
          payes: '',
          message: subData['message']);
    }).toList();
  }
}
