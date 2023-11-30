import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/repository_welcome.dart';

import '../../../Profile/domaine/entitie/profile_user.dart';

class GetUsersUsecase {
  final RepositoryWelcome welcomeRepository;
  GetUsersUsecase(this.welcomeRepository);
  Future<Either<Faillure, List<ProfileUser>>> call() async {
    return await welcomeRepository.getUsers();
  }
}
