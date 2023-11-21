import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import '../../domaine/entitie/profile_user.dart';

abstract class ProfileDataSource {
  Future<ProfileUser> getMyProfile();
  Future<ProfileUser> getAutreProfile(ProfileUser profile);
  Future<Stream<QuerySnapshot>> getmesArticles(String typearticle);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final _firestore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  List<String> collectionName = [
    'Forniture',
    'Livres',
    'Cartables',
    'Stylo',
    'Cartables',
    'Autres',
  ];
  @override
  Future<Stream<QuerySnapshot<Map>>> getmesArticles(String typearticle) async {
    // for (var collection in collectionName) {
    //   final querysnapshot = await _firestore
    //       .collection('Articles')
    //       .doc(_auth.currentUser!.email)
    //       .collection(collection)
    //       .get();
    //   final xx = querysnapshot.docs.map((alluser) {
    //     final data = alluser.data();
    //     final usrid = alluser.id;

    //     return ProfleArticle(
    //         userId: data['userId'] ?? "",
    //         type: data['type'],
    //         email: data['email'],
    //         id: usrid,
    //         name: data['name'],
    //         prix: data['prix'],
    //         article: data['article'],
    //         articleUrl: data['articleUrl']);
    //   }).toList();
    //   articlesList.addAll(xx);
    // }
    return _firestore
        .collection('Articles')
        .doc()
        .collection(typearticle)
        .snapshots();
  }

  @override
  Future<ProfileUser> getMyProfile() {
    throw UnimplementedError();
  }

  @override
  Future<ProfileUser> getAutreProfile(ProfileUser profile) {
    throw UnimplementedError();
  }
}
