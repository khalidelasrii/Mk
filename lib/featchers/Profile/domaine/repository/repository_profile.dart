import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';

import '../entitie/profile_user.dart';

abstract class RepositoryProfile {
  Future<Either<Faillure, Stream<QuerySnapshot>>> getMesArticle(
      String typearticle);
  Future<Either<Faillure, ProfileUser>> getMyProfile();
  Future<Either<Faillure, ProfileUser>> getAutreProfile(ProfileUser proUser);
}
