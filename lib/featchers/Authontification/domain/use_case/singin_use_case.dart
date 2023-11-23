import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/repository_auth.dart';

class SingInUseCase {
  RepositoryAuth userRepository;
  SingInUseCase(this.userRepository);

  Future<Either<String, User?>> call(Usr usr) async {
    return await userRepository.singIn(usr);
  }
}
