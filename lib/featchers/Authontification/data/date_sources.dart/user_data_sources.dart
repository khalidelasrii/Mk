import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

abstract class UserDataSources {
  Future<User?> signIn(Usr usr);
  Future<User?> signUp(Usr usr);
  Future<Unit> singOut();
  Future<UserCredential?> signInWithGoogle();
}

class UserDataSourcesImpl1 implements UserDataSources {
  final _auth = FirebaseAuth.instance;
  final _firebase = FirebaseFirestore.instance;

  @override
  Future<User?> signIn(Usr usr) async {
    await _auth.signInWithEmailAndPassword(
        email: usr.email, password: usr.password);
    return _auth.currentUser;
  }

  @override
  Future<User?> signUp(Usr usr) async {
    await _auth.createUserWithEmailAndPassword(
      email: usr.email,
      password: usr.password,
    );

    await _firebase.collection('Users').add(UserModel(
            uid: _auth.currentUser!.uid,
            name: usr.name,
            phoneNumber: usr.phoneNumber,
            adress: usr.adress,
            payes: usr.payes,
            email: usr.email,
            password: usr.password)
        .toMap());

    return _auth.currentUser;
  }

  @override
  Future<Unit> singOut() async {
    await _auth.signOut();
    return unit;
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
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

        // Sign in with Firebase using the AuthCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        // If sign in silently is not successful, return null
        return null;
      }
    } catch (error) {
      // Handle any errors that occur during the sign-in process
      return null;
    }
  }
}
