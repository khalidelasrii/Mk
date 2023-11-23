import '../entitie/user.dart';
import '../repository/repository_auth.dart';

class AddUserUseCase {
  RepositoryAuth repositoryAuth;
  AddUserUseCase(this.repositoryAuth);
  Future<void> call(Usr usr) async {
    await repositoryAuth.addUser(usr);
  }
}
