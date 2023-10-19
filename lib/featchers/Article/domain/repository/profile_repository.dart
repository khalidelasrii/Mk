import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/data/models/profileModel.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileRepository {
  Future<Either<Faillure, List<Article>>> getMesArticles(String email);
  Future<Either<Faillure, Unit>> sendMessage(ProfileModel message);
  Future<Either<Faillure, List<String>>> getMessages();
}
