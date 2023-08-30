import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class UserRepository {
  Future<Either<String, Unit>> singIn(Usr usr);
  Future<Either<String, Unit>> singUp(Usr usr);
  Future<Either<String, UserCredential?>> signInWithGoogle();
  Future<Unit> singOut();
  Future<bool> isSignIn();
  Future<Usr> getUserId();
}
