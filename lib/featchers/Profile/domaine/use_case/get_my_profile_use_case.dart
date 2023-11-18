import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';

import '../repository/repository_profile.dart';

class GetMyProfileUseCase {
  RepositoryProfile repositoryProfile;
  GetMyProfileUseCase(this.repositoryProfile);
  Future<Either<Faillure, ProfileUser>> call() async {
    return await repositoryProfile.getMyProfile();
  }
}
