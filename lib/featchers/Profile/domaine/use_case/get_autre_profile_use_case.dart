import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';

import '../entitie/profile_user.dart';
import '../repository/repository_profile.dart';

class GetAutreProfileUseCase {
  final RepositoryProfile repositoryProfile;
  GetAutreProfileUseCase(this.repositoryProfile);

  Future<Either<Faillure, ProfileUser>> call(ProfileUser proUser) async {
    return await repositoryProfile.getProfile(proUser);
  }
}
