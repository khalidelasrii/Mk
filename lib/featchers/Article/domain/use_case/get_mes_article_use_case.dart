import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/repository/profile_repository.dart';

class GetMesArticlesUSeCase {
  final ProfileRepository _profileRepository;
  GetMesArticlesUSeCase(this._profileRepository);

  Future<Either<Faillure, List<Article>>> call() async {
    return await _profileRepository.getMesArticles();
  }
}
