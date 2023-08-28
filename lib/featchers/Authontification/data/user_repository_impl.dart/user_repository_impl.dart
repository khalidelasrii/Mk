import 'package:dartz/dartz.dart';

import 'package:mk/featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class UserRepositooryImpl implements UserRepository {
  UserDataSources userDataSources;
  UserRepositooryImpl({required this.userDataSources});
  @override
  Future<Either<String, Unit>> singIn(Usr usr) async {
    try {
      await userDataSources.signIn(usr);
      return const Right(unit);
    } catch (e) {
      return const Left('Error to connect');
    }
  }

  @override
  Future<Either<String, Unit>> singUp(Usr usr) async {
    try {
      await userDataSources.signUp(usr);
      return const Right(unit);
    } catch (e) {
      return const Left('Error to Connect');
    }
  }

  @override
  Future<Unit> singOut() async {
    return await userDataSources.singOut();
  }

  @override
  Future<bool> isSignIn() async {
    return await userDataSources.isSignIn();
  }

  @override
  Future<Usr> getUserId() async {
    return await userDataSources.getUserId();
  }
}
