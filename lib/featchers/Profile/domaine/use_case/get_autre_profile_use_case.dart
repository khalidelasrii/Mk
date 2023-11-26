import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../entitie/profile_articles.dart';
import '../entitie/profile_user.dart';
import '../repository/repository_profile.dart';

class GetAutreProfileUseCase {
  final RepositoryProfile repositoryProfile;
  GetAutreProfileUseCase(this.repositoryProfile);

  Future<Either<Stream<QuerySnapshot<Map<String, dynamic>>>, ProfileUser>> call(
      ProfleArticle proUser) async {
    return await repositoryProfile.getProfile(proUser);
  }
}
