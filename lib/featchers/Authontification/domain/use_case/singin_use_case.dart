import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

class SingInUseCase {
  UserRepository userRepository;
  SingInUseCase(this.userRepository);

  Future<Either<String, Unit>> call(Usr usr) async {
    return await userRepository.singIn(usr);
  }
}
