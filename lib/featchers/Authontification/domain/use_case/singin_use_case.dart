import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/repository/user_repository.dart';

import '../../../../core/errure/faillure.dart';

class SingInUseCase {
  UserRepository userRepository;
  SingInUseCase({required this.userRepository});

  Future<Either<Faillure, List<Usr>>> call() async {
    return await userRepository.singIn();
  }
}
