import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class SingOutUseCase {
  RepositoryAuth userRepository;
  SingOutUseCase(this.userRepository);
  Future<Unit> call() async {
    return userRepository.singOut();
  }
}
