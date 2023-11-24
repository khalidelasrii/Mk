import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class SingUpUseCase {
  RepositoryAuth userRepository;
  SingUpUseCase(this.userRepository);

  Future<void> call(Usr usr) async {
    return await userRepository.singUp(usr);
  }
}
