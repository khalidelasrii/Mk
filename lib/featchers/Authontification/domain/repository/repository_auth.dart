import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class RepositoryAuth {
  Future<Either<String, User?>> singIn(Usr usr);
  Future<Either<String, User?>> singUp(Usr usr);
  Future<Either<String, UserCredential?>> signInWithGoogle();
  Future<void> singOut();
  Future<void> addUser(Usr user);
}
