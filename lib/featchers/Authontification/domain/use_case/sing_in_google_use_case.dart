import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class SingInGoogleUseCase {
  RepositoryAuth userRepository;
  SingInGoogleUseCase(this.userRepository);

  Future<Either<String, UserCredential?>> call() async {
    return await userRepository.signInWithGoogle();
  }
}
