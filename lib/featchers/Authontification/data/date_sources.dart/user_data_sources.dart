import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

abstract class UserDataSources {
  Future<void> signIn(Usr usr);
  Future<void> signUp(Usr usr);
  Future<void> singOut();
  Future<void> signInWithGoogle();
}

class UserDataSourcesImpl1 implements UserDataSources {
  final _auth = FirebaseAuth.instance;
  final _firebase = FirebaseFirestore.instance;

  @override
  Future<void> signIn(Usr usr) async {
    await _auth.signInWithEmailAndPassword(
        email: usr.email, password: usr.password!);
  }

  @override
  Future<void> signUp(Usr usr) async {
    await _auth.createUserWithEmailAndPassword(
      email: usr.email,
      password: usr.password!,
    );
    final user = _auth.currentUser;
    return addUser(Usr(
        adress: "adress",
        payes: "payes",
        phoneNumber: usr.phoneNumber,
        email: usr.email,
        password: usr.password,
        profileUrl: usr.profileUrl,
        name: usr.name,
        uid: user!.uid));
  }

  @override
  Future<void> singOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Attempt to sign in silently
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      // If sign in silently is successful, get authentication credentials
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      // Create AuthCredential using Google Sign-In credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      return addUser(Usr(
        adress: "",
        payes: "",
        email: user.user!.email!,
        password: "",
        name: user.user!.displayName!,
        uid: user.user!.uid,
        phoneNumber: user.user!.phoneNumber,
        profileUrl: user.user!.photoURL,
      ));
    }
  }

  Future<void> addUser(Usr user) async {
    await _firebase.collection('Users').doc(user.uid).set(UserModel(
            uid: user.uid,
            name: user.name,
            phoneNumber: user.phoneNumber,
            adress: user.adress,
            payes: user.payes,
            email: user.email,
            password: user.password,
            profileUrl: '')
        .toMap());
  }
}
