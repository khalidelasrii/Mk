import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

import '../../../Profile/domaine/entitie/profile_user.dart';

abstract class WelcomeRepository {
  Future<Either<Faillure, List<WelcomeArticle>>> getAllWelcomeArticle();
  Future<Either<Faillure, List<WelcomeArticle>>> articleParCategorie(
      String collection);
  Future<Stream<QuerySnapshot<Object?>>> getSearchResults(String query);
  Future<Either<Faillure, List<ProfileUser>>> getUsers();
}
