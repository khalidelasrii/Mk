import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class UserRepositooryImpl implements UserRepository {
  UserDataSources userDataSources;
  UserRepositooryImpl({required this.userDataSources});
  @override
  Future<Either<Faillure, Map>> singIn(Usr usr) async {
    try {
      final user = await userDataSources.signIn(usr);

      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Map>> singUp(Usr usr) async {
    try {
      final user = await userDataSources.signUp(usr);

      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
