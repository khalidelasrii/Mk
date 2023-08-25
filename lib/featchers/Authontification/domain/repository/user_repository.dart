import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class UserRepository {
  Future<Either<String, Unit>> singIn(Usr usr);
  Future<Either<String, Unit>> singUp(Usr usr);
  Future<Unit> singOut();
}
