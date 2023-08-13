import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mk/featchers/posts/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/posts/data/repository_impl/article_repository__impl.dart';
import 'package:mk/featchers/posts/domain/repository/repository_articles.dart';
import 'package:mk/featchers/posts/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/dellet_article_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/get_articles_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/update_article_use_case.dart';
import 'package:mk/featchers/posts/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/posts/presentation/bloc/article/article_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Articles

  // Bloc
  sl.registerFactory(() => ArticleBloc(getArticlesUseCase: sl()));

  sl.registerFactory(() => AddordeletorupdateBloc(
        addArticleUseCase: sl(),
        delletArticleUseCase: sl(),
        updateArticleUseCase: sl(),
      ));
  // Usecases
  sl.registerLazySingleton(() => GetArticlesUseCase(sl()));
  sl.registerLazySingleton(() => AddArticleUseCase(sl()));
  sl.registerLazySingleton(() => DelletArticleUseCase(sl()));
  sl.registerLazySingleton(() => UpdateArticleUseCase(sl()));
  //Repository
  sl.registerLazySingleton<RepositoryArticles>(
      () => ArticleRepositoryImpl(articlesFirebase: sl()));
  //Datasource
  // ignore: no_leading_underscores_for_local_identifiers
  sl.registerLazySingleton<ArticlesRemoteDataSource>(() => ArticlesFirebase());

  //! external

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firebaseFirestore);
}
