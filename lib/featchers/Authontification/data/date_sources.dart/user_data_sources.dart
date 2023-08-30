import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

abstract class UserDataSources {
  Future<Unit> signIn(Usr usr);
  Future<Unit> signUp(Usr usr);
  Future<Unit> singOut();
  Future<bool> isSignIn();
  Future<UserModel> getUserId();
  Future<UserCredential?> signInWithGoogle();
}

class UserDataSourcesImpl1 implements UserDataSources {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Unit> signIn(Usr usr) async {
    await _auth.signInWithEmailAndPassword(
        email: usr.email, password: usr.password);
    return unit;
  }

  @override
  Future<Unit> signUp(Usr usr) async {
    await _auth.createUserWithEmailAndPassword(
      email: usr.email,
      password: usr.password,
    );

    return unit;
  }

  @override
  Future<Unit> singOut() async {
    await _auth.signOut();
    return unit;
  }

  @override
  Future<bool> isSignIn() async => _auth.currentUser?.uid != null;

  @override
  Future<UserModel> getUserId() async {
    final user = _auth.currentUser;
    return UserModel(
        password: '',
        uid: user!.uid,
        name: user.displayName ?? 'Best User',
        phoneNumber: user.phoneNumber ?? '',
        email: user.email!,
        profile: user.photoURL ?? '');
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (error) {
      print("Error signing in with Google: $error");
    }
  }
}
