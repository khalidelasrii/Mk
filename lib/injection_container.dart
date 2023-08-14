import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mk/featchers/posts/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/posts/domain/repository/repository_articles.dart';
import 'package:mk/featchers/posts/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/get_articles_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/update_article_use_case.dart';
import 'package:mk/featchers/posts/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/posts/presentation/bloc/article/article_bloc.dart';

import 'featchers/posts/data/repository_impl/article_repository__impl.dart';
import 'featchers/posts/domain/use_case/dellet_article_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ArticleBloc(getArticles: sl()));
  sl.registerFactory(() => AddordeletorupdateBloc(
        addArticle: sl(),
        delletArticle: sl(),
        updateArticle: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetArticlesUseCase(sl()));
  sl.registerLazySingleton(() => AddArticleUseCase(sl()));
  sl.registerLazySingleton(() => DelletArticleUseCase(sl()));
  sl.registerLazySingleton(() => UpdateArticleUseCase(sl()));

  // Repository
  sl.registerLazySingleton<RepositoryArticles>(
      () => ArticleRepositoryImpl(articlesFirebase: sl()));

  // Data sources
  sl.registerLazySingleton<ArticlesRemoteDataSource>(() => ArticlesFirebase());

  // Other dependencies or services can be registered here

  sl.registerLazySingleton(() => sl<FirebaseFirestore>());
}
