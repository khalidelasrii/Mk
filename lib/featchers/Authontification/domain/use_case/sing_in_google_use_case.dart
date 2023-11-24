import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class SingInGoogleUseCase {
  RepositoryAuth userRepository;
  SingInGoogleUseCase(this.userRepository);

  Future<void> call() async {
    return await userRepository.signInWithGoogle();
  }
}
