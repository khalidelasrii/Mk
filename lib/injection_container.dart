import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mk/featchers/Article/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';
import 'package:mk/featchers/Article/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/addoorable_articles_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_all_article_usecase.dart';
import 'package:mk/featchers/Article/domain/use_case/get_articles_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/update_article_use_case.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Authontification/domain/use_case/get_user_id_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/is_singin_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_in_google_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_out_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/welcome_screen/data/data_sources/welcome_data_source.dart';
import 'package:mk/featchers/welcome_screen/data/repository_impl/welcome_repository_impl.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/adoor_articles_cuibit/adoor_articles_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

import 'featchers/Article/data/repository_impl/article_repository__impl.dart';
import 'featchers/Article/domain/use_case/dellet_article_use_case.dart';
import 'featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'featchers/Authontification/data/user_repository_impl.dart/user_repository_impl.dart';
import 'featchers/Authontification/domain/repository/user_repository.dart';
import 'featchers/Authontification/domain/use_case/singup_use_case.dart';
import 'featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'featchers/welcome_screen/domain/use_case/get_all_welcome_article_use_case.dart';
import 'featchers/welcome_screen/presentation/bloc/secondcont_cuibit/secoundcont_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ArticleBloc(
      getArticles: sl(),
      getAllArticleUseCase: sl(),
      addoorableArticlesUseCase: sl()));
  sl.registerFactory(() => AddordeletorupdateBloc(
        addArticle: sl(),
        delletArticle: sl(),
        updateArticle: sl(),
      ));
  sl.registerFactory(() => AuthCubit(
        singInUseCase: sl(),
        singOutUseCase: sl(),
        singUpUseCase: sl(),
        isSingInUsecase: sl(),
        getUserIdUSecase: sl(),
        singInGoogleUseCase: sl(),
      ));
  sl.registerFactory(() => ToolbarCubit());
  sl.registerFactory(() => CategoriecheldrenCubit());
  sl.registerFactory(() => SecoundcontCubit());
  sl.registerFactory(
      () => AdoorArticlesCubit(getAllWelcomeArticleUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => SingInUseCase(sl()));
  sl.registerLazySingleton(() => SingUpUseCase(sl()));
  sl.registerLazySingleton(() => SingOutUseCase(sl()));
  sl.registerLazySingleton(() => IsSingInUsecase(sl()));
  sl.registerLazySingleton(() => GetUserIdUSecase(sl()));
  sl.registerLazySingleton(() => SingInGoogleUseCase(sl()));

  sl.registerLazySingleton(() => GetAllArticleUseCase(sl()));
  sl.registerLazySingleton(() => GetArticlesUseCase(sl()));
  sl.registerLazySingleton(() => AddoorableArticlesUseCase(sl()));
  sl.registerLazySingleton(() => AddArticleUseCase(sl()));
  sl.registerLazySingleton(() => DelletArticleUseCase(sl()));
  sl.registerLazySingleton(() => UpdateArticleUseCase(sl()));
  sl.registerLazySingleton(() => GetAllWelcomeArticleUseCase(sl()));

  // Repository

  sl.registerLazySingleton<RepositoryArticles>(
      () => ArticleRepositoryImpl(articlesFirebase: sl()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositooryImpl(userDataSources: sl()));
  sl.registerLazySingleton<WelcomeRepository>(
      () => WelcomeRepositoryImpl(welcomeDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<ArticlesRemoteDataSource>(() => ArticlesFirebase());
  sl.registerLazySingleton<UserDataSources>(() => UserDataSourcesImpl1());
  sl.registerLazySingleton<WelcomeDataSource>(() => WelcomeDataSourcesImpl());

  // Other dependencies or services can be registered here

  sl.registerLazySingleton(() => sl<FirebaseFirestore>());
  sl.registerLazySingleton(() => sl<FirebaseAuth>());
}
