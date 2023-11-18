import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';

import '../entitie/profile_user.dart';

abstract class RepositoryProfile {
  Future<Either<Faillure, ProfileUser>> getMyProfile();
  Future<Either<Faillure, ProfileUser>> getAutreProfile(ProfileUser proUser);
}
