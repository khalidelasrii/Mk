import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileDataSources {
  Future<List<Article>> getmesArticles();
  Future<Unit> sendMessage(String message);
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages();
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
  Future<Unit> sendMessage(String message) async {
    final collection = _firestore.collection("Descusion");
    collection.add({"userId": _auth.currentUser!.uid});
    collection.doc(_auth.currentUser!.uid).collection("MyMessages").add({
      "message": message,
      "email": _auth.currentUser!.email,
      "temp": Timestamp.now(),
      "userid": _auth.currentUser!.uid,
    });
    return Future.value(unit);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    return _firestore
        .collection('Descusion')
        .doc(_auth.currentUser!.uid)
        .collection("MyMessages")
        .snapshots();
  }
}
