import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../../../core/errure/faillure.dart';

abstract class RepositoryArticles {
  Future<Either<Faillure, List<Article>>> getmesArticles();

  Future<Either<Faillure, List<Article>>> getallArticles();

  Future<Either<Faillure, Unit>> updateArticle(Article article);

  Future<Either<Faillure, Unit>> addArticle(XFile? image, Article article);

  Future<Either<Faillure, Unit>> delletArticle(String collectionId, String id);
}
