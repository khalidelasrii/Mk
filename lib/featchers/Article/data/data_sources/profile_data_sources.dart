import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Article/data/models/profileModel.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileDataSources {
  Future<List<Article>> getmesArticles(String profile);
  Future<Unit> sendMessage(ProfileModel message);
  Future<List<String>> getMessages();
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
  Future<List<Article>> getmesArticles(String? email) async {
    for (var collection in collectionName) {
      final querysnapshot = await _firestore
          .collection('Articles')
          .doc(email)
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
  Future<Unit> sendMessage(ProfileModel profile) async {
    final pro = ProfileModel(
        email: profile.email,
        id: '',
        numberPhone: '',
        payes: '',
        message: profile.message);
    await _firestore
        .collection("Mesagerie")
        .doc(_auth.currentUser!.email)
        .set(pro.toMap());

    return Future.value(unit);
  }

  @override
  Future<List<String>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }
}
