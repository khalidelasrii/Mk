import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileDataSources {
  Future<List<Article>> getmesArticles(String profile);
  Future<Unit> sendMessage(String message);
}

class ProfileDataSourcesImpl implements ProfileDataSources {
  final _firestore = FirebaseFirestore.instance;
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
  Future<Unit> sendMessage(String) {
    return Future.value(unit);
  }
}
