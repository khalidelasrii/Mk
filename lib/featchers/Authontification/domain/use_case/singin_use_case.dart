import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class SingInUseCase {
  RepositoryAuth userRepository;
  SingInUseCase(this.userRepository);

  Future<void> call(Usr usr) async {
    return await userRepository.singIn(usr);
  }
}
