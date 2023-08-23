import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class UserRepositooryImpl implements UserRepository {
  UserDataSources userDataSources;
  UserRepositooryImpl({required this.userDataSources});
  @override
  Future<Either<String, User?>> singIn(Usr usr) async {
    return userDataSources.signIn(usr);
  }

  @override
  Future<Either<Faillure, Unit>> singUp(Usr usr) async {
    try {
      final user = await userDataSources.signUp(usr);

      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Unit> singOut() {
    userDataSources.singOut();
    return Future.value(unit);
  }
}
