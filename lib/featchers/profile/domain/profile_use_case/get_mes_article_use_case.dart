import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/profile/domain/repository/profile_repository.dart';

class GetMesArticlesUSeCase {
  final ProfileRepository _profileRepository;
  GetMesArticlesUSeCase(this._profileRepository);

  Future<Either<Faillure, List<Article>>> call(String email) async {
    return await _profileRepository.getMesArticles(email);
  }
}
