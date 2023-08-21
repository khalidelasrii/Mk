import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class UserRepository {
  Future<Either<Faillure, List<Usr>>> singIn();
  Future<Either<Faillure, List<Usr>>> singUp();
}
