import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class SingOutUseCase {
  RepositoryAuth userRepository;
  SingOutUseCase(this.userRepository);
  Future<void> call() async {
    return userRepository.singOut();
  }
}
