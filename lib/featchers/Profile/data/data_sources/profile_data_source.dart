import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Article/domain/entitie/article.dart';
import '../../domaine/entitie/profile_user.dart';

abstract class ProfileDataSource {
  Future<ProfileUser> getMyProfile();
  Future<ProfileUser> getAutreProfile(ProfileUser profile);
  Future<List<Article>> getmesArticles();
}

class ProfileDataSourceImpl implements ProfileDataSource {
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
            userId: data['userId'] ?? "",
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
  Future<ProfileUser> getMyProfile() {
    // TODO: implement getMyProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileUser> getAutreProfile(ProfileUser profile) {
    throw UnimplementedError();
  }
}
