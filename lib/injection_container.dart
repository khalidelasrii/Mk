import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mk/featchers/Article/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';
import 'package:mk/featchers/Article/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/addoorable_articles_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_all_article_usecase.dart';
import 'package:mk/featchers/Article/domain/use_case/get_descusion_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_message_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/send_message_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/update_article_use_case.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/get_mes_articles_cuibit/get_mes_articles_cubit.dart';
import 'package:mk/featchers/Article/presentation/bloc/message_cuibite/messag_cubit.dart';
import 'package:mk/featchers/Authontification/domain/use_case/get_user_id_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/is_singin_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_in_google_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_out_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/Article/data/data_sources/profile_data_sources.dart';
import 'package:mk/featchers/Article/data/repository_impl/profile_repository_impl.dart';
import 'package:mk/featchers/Article/domain/use_case/get_mes_article_use_case.dart';
import 'package:mk/featchers/Article/domain/repository/profile_repository.dart';
import 'package:mk/featchers/welcome_screen/data/data_sources/welcome_data_source.dart';
import 'package:mk/featchers/welcome_screen/data/repository_impl/welcome_repository_impl.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/article_par_type_use_case.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/get_search_results_use_case.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/adoor_articles_cuibit/adoor_articles_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/appbafont_cuibit/appbafont_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/article_par_categorie_cuibit/article_par_categorie_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/recherch_cuibit/recherch_cubit.dart';
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
  sl.registerFactory(() =>
      ArticleBloc(getAllArticleUseCase: sl(), addoorableArticlesUseCase: sl()));
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
  sl.registerFactory(() => RecherchCubit(getSearchResultsUseCase: sl()));
  sl.registerFactory(() => GetMesArticlesCubit(getMesArticlesUSeCase: sl()));

  sl.registerFactory(() => ToolbarCubit());
  sl.registerFactory(() => CategoriecheldrenCubit());
  sl.registerFactory(() => SecoundcontCubit());
  sl.registerFactory(() => AppbafontCubit());

  sl.registerFactory(
      () => AdoorArticlesCubit(getAllWelcomeArticleUseCase: sl()));
  sl.registerFactory(
      () => ArticleParCategorieCubit(articleParTypeUseCase: sl()));
  sl.registerFactory(() => MessagCubit(
        getDescusionUseCase: sl(),
        getmessagesUseCase: sl(),
        sendMessageUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetSearchResultsUseCase(sl()));
  sl.registerLazySingleton(() => GetDescusionUseCase(sl()));

  sl.registerLazySingleton(() => SingInUseCase(sl()));
  sl.registerLazySingleton(() => SingUpUseCase(sl()));
  sl.registerLazySingleton(() => SingOutUseCase(sl()));
  sl.registerLazySingleton(() => IsSingInUsecase(sl()));
  sl.registerLazySingleton(() => GetUserIdUSecase(sl()));
  sl.registerLazySingleton(() => SingInGoogleUseCase(sl()));
  sl.registerLazySingleton(() => ArticleParTypeUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => GetMessageUseCase(sl()));

  sl.registerLazySingleton(() => GetAllArticleUseCase(sl()));
  sl.registerLazySingleton(() => AddoorableArticlesUseCase(sl()));
  sl.registerLazySingleton(() => AddArticleUseCase(sl()));
  sl.registerLazySingleton(() => DelletArticleUseCase(sl()));
  sl.registerLazySingleton(() => UpdateArticleUseCase(sl()));
  sl.registerLazySingleton(() => GetAllWelcomeArticleUseCase(sl()));
  sl.registerLazySingleton(() => GetMesArticlesUSeCase(sl()));

  // Repository

  sl.registerLazySingleton<RepositoryArticles>(
      () => ArticleRepositoryImpl(articlesFirebase: sl()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositooryImpl(userDataSources: sl()));
  sl.registerLazySingleton<WelcomeRepository>(
      () => WelcomeRepositoryImpl(welcomeDataSource: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(profileDataSources: sl()));

  // Data sources
  sl.registerLazySingleton<ArticlesRemoteDataSource>(() => ArticlesFirebase());
  sl.registerLazySingleton<UserDataSources>(() => UserDataSourcesImpl1());
  sl.registerLazySingleton<WelcomeDataSource>(() => WelcomeDataSourcesImpl());
  sl.registerLazySingleton<ProfileDataSources>(() => ProfileDataSourcesImpl());

  // Other dependencies or services can be registered here

  sl.registerLazySingleton(() => sl<FirebaseFirestore>());
  sl.registerLazySingleton(() => sl<FirebaseAuth>());
}
