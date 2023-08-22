import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class UserRepository {
  Future<Either<Faillure, Map>> singIn(Usr usr);
  Future<Either<Faillure, Map>> singUp(Usr usr);
}
