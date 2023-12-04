import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

import '../../../Profile/domaine/entitie/profile_user.dart';

abstract class RepositoryWelcome {
  Future<Either<Faillure, List<WelcomeArticle>>> getAllArticle();
  Future<Either<Faillure, List<WelcomeArticle>>> articleParType(
      String collection);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> searchResults(
      String query);
  Future<Either<Faillure, List<ProfileUser>>> getUsers();
}
