import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domaine/entitie/profile_user.dart';

abstract class ProfileDataSource {
  Future<ProfileUser> getProfile(ProfileUser profile);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getmesArticles(
      String typearticle);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getmesArticles(
      String type) async {
    return _firestore
        .collection('Articles')
        .doc(_auth!.uid)
        .collection(type)
        .orderBy("date", descending: true)
        .snapshots();
  }

  @override
  Future<ProfileUser> getProfile(ProfileUser profile) {
    throw UnimplementedError();
  }
}
