import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDataSources {
  Future<Either<String, Unit>> signIn(Usr usr);
  Future<Either<String, Unit>> signUp(Usr usr);
  Future<Unit> singOut();
}

class UserDataSourcesImpl1 implements UserDataSources {
  final _auth = FirebaseAuth.instance;
  @override
  Future<Either<String, Unit>> signIn(Usr usr) async {
    try {
      _auth.signInWithEmailAndPassword(
          email: usr.email!, password: usr.password!);
      return const Right(unit);
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either<String, Unit>> signUp(Usr usr) async {
    try {
      _auth.createUserWithEmailAndPassword(
          email: usr.email!, password: usr.password!);
      return const Right(unit);
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Unit> singOut() async {
    _auth.signOut();
    return unit;
  }
}
