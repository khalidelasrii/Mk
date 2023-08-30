import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class SingInGoogleUseCase {
  UserRepository userRepository;
  SingInGoogleUseCase(this.userRepository);

  Future<Either<String, UserCredential?>> call() async {
    return await userRepository.signInWithGoogle();
  }
}
