import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class UserRepository {
  Future<Either<String, User?>> singIn(Usr usr);
  Future<Either<Faillure, Unit>> singUp(Usr usr);
  Future<Unit> singOut();
}
