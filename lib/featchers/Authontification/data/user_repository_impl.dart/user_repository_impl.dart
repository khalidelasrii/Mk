import 'package:dartz/dartz.dart';

import 'package:mk/featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class UserRepositooryImpl implements UserRepository {
  UserDataSources userDataSources;
  UserRepositooryImpl({required this.userDataSources});
  @override
  Future<Either<String, Unit>> singIn(Usr usr) async {
    return userDataSources.signIn(usr);
  }

  @override
  Future<Either<String, Unit>> singUp(Usr usr) async {
    return await userDataSources.signUp(usr);
  }

  @override
  Future<Unit> singOut() async {
    return await userDataSources.singOut();
  }
}
