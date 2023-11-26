import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domaine/entitie/profile_articles.dart';
import '../../domaine/entitie/profile_user.dart';

abstract class ProfileDataSource {
  Future<ProfileUser> getProfile(ProfileUser profile);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getmesArticles(
      ProfleArticle profleArticle);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getmesArticles(
      ProfleArticle profleArticle) async {
    return _firestore
        .collection('Articles')
        .doc(profleArticle.uid)
        .collection(profleArticle.articleType)
        .orderBy("date", descending: true)
        .snapshots();
  }

  @override
  Future<ProfileUser> getProfile(ProfileUser profile) async {
    final data = await _firestore.collection("Users").doc(profile.uid).get();
    final sub = data.data();

    return ProfileUser(
        name: sub?["name"],
        email: sub?["email"],
        uid: sub?["id"],
        phoneNumber: sub?['phoneNumber'],
        adress: sub?["adress"]);
  }
}
