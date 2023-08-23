import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class SingUpUseCase {
  UserRepository userRepository;
  SingUpUseCase(this.userRepository);

  Future<Either<Faillure, Unit>> call(Usr usr) async {
    return await userRepository.singUp(usr);
  }
}
