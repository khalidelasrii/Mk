import 'package:mk/featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class UserRepositooryImpl implements RepositoryAuth {
  UserDataSources userDataSources;
  UserRepositooryImpl({required this.userDataSources});
  @override
  Future<void> singIn(Usr usr) async {
    await userDataSources.signIn(usr);
  }

  @override
  Future<void> signInWithGoogle() async {
    await userDataSources.signInWithGoogle();
  }

  @override
  Future<void> singUp(Usr usr) async {
    await userDataSources.signUp(usr);
  }

  @override
  Future<void> singOut() async {
    return userDataSources.singOut();
  }
}
