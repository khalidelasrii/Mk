import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class UserRepositooryImpl implements UserRepository {
  @override
  Future<Either<Faillure, List<Usr>>> singIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Faillure, List<Usr>>> singUp() {
    throw UnimplementedError();
  }
}
