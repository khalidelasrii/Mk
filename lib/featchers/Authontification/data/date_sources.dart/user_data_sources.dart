import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDataSources {
  Future<Either<String, User?>> signIn(Usr usr);
  Future<Unit> signUp(Usr usr);
  Future<Unit> singOut();
}

class UserDataSourcesImpl1 implements UserDataSources {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Either<String, User?>> signIn(Usr usr) async {
    try {
      _auth.signInWithEmailAndPassword(
          email: usr.email!, password: usr.password!);
      final user = _auth.currentUser;

      return Right(user);
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Unit> signUp(Usr usr) async {
    _auth.createUserWithEmailAndPassword(
        email: usr.email!, password: usr.password!);
    return Future.value(unit);
  }

  Future<Unit> singOut() async {
    _auth.signOut();
    return Future.value(unit);
  }
}
