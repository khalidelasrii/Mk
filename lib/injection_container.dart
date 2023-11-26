import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mk/featchers/Article/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';
import 'package:mk/featchers/Article/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/addoorable_articles_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_all_article_usecase.dart';
import 'package:mk/featchers/Article/domain/use_case/update_article_use_case.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_in_google_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_out_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/Article/data/data_sources/profile_data_sources.dart';
import 'package:mk/featchers/Profile/data/repository_impl/repository_profile_impl.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_autre_profile_use_case.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_mes_articles_use_case.dart';
import 'package:mk/featchers/Profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:mk/featchers/messaget_futchers/datat/data_sources/data_sources.dart';
import 'package:mk/featchers/messaget_futchers/datat/repository_impl/repository_impl_message.dart';
import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/get_descusion_use_case.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/get_message_use_case.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/message_vu.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/nbr_vu_use_case.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/send_message_use_case.dart';
import 'package:mk/featchers/messaget_futchers/presentation/bloc/descusion_cubit/descusion_cubit.dart';

import 'package:mk/featchers/welcome_screen/data/data_sources/welcome_data_source.dart';
import 'package:mk/featchers/welcome_screen/data/repository_impl/welcome_repository_impl.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/article_par_type_use_case.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/get_search_results_use_case.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/get_users_usecase.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';

import 'featchers/Article/data/repository_impl/article_repository__impl.dart';
import 'featchers/Article/domain/use_case/dellet_article_use_case.dart';
import 'featchers/Authontification/data/date_sources.dart/user_data_sources.dart';
import 'featchers/Authontification/data/user_repository_impl.dart/user_repository_impl.dart';
import 'featchers/Authontification/domain/repository/repository_auth.dart';
import 'featchers/Authontification/domain/use_case/singup_use_case.dart';
import 'featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'featchers/Profile/data/data_sources/profile_data_source.dart';
import 'featchers/Profile/domaine/repository/repository_profile.dart';
import 'featchers/messaget_futchers/presentation/bloc/message_cubit/messages_cubit.dart';
import 'featchers/welcome_screen/domain/use_case/get_all_welcome_article_use_case.dart';
import 'featchers/welcome_screen/presentation/bloc/secondcont_cuibit/secoundcont_cubit.dart';
import 'featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => UsersWelcomeScreenCubit(getUsersUsecase: sl()));
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
        singInGoogleUseCase: sl(),
      ));
  sl.registerFactory(() => WelcomeArticleBlocBloc(
        getSearchResultsUseCase: sl(),
        getAllWelcomeArticleUseCase: sl(),
        articleParTypeUseCase: sl(),
      ));
  sl.registerFactory(() => ToolbarCubit());
  sl.registerFactory(() => CategoriecheldrenCubit());
  sl.registerFactory(() => SecoundcontCubit());
  sl.registerFactory(() =>
      ProfileBloc(getMesArticlesUseCase: sl(), getAutreProfileUseCase: sl()));

  sl.registerFactory(
      () => DescusionCubit(getDescusionUseCase: sl(), nbrVuUseCase: sl()));
  sl.registerFactory(() => MessagesCubit(
      getMessageUseCase: sl(),
      sendMessageUseCase: sl(),
      messageVuUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAutreProfileUseCase(sl()));

  sl.registerLazySingleton(() => GetUsersUsecase(sl()));

  sl.registerLazySingleton(() => GetMesArticlesUseCase(sl()));
  sl.registerLazySingleton(() => NbrVuUseCase(sl()));
  sl.registerLazySingleton(() => MessageVuUseCase(sl()));
  sl.registerLazySingleton(() => GetMessageUseCase(sl()));
  sl.registerLazySingleton(() => GetDescusionUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => GetSearchResultsUseCase(sl()));
  sl.registerLazySingleton(() => SingInUseCase(sl()));
  sl.registerLazySingleton(() => SingUpUseCase(sl()));
  sl.registerLazySingleton(() => SingOutUseCase(sl()));
  sl.registerLazySingleton(() => SingInGoogleUseCase(sl()));
  sl.registerLazySingleton(() => ArticleParTypeUseCase(sl()));
  sl.registerLazySingleton(() => GetAllArticleUseCase(sl()));
  sl.registerLazySingleton(() => AddoorableArticlesUseCase(sl()));
  sl.registerLazySingleton(() => AddArticleUseCase(sl()));
  sl.registerLazySingleton(() => DelletArticleUseCase(sl()));
  sl.registerLazySingleton(() => UpdateArticleUseCase(sl()));
  sl.registerLazySingleton(() => GetAllWelcomeArticleUseCase(sl()));

  // Repository

  sl.registerLazySingleton<RepositoryMesaage>(
      () => RepositoryImplMessage(dataSourcesMessages: sl()));
  sl.registerLazySingleton<RepositoryProfile>(
      () => RepositoryProfileImpl(profileDataSource: sl()));
  sl.registerLazySingleton<RepositoryArticles>(
      () => ArticleRepositoryImpl(articlesFirebase: sl()));
  sl.registerLazySingleton<RepositoryAuth>(
      () => UserRepositooryImpl(userDataSources: sl()));
  sl.registerLazySingleton<WelcomeRepository>(
      () => WelcomeRepositoryImpl(welcomeDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl());

  sl.registerLazySingleton<ArticlesRemoteDataSource>(() => ArticlesFirebase());
  sl.registerLazySingleton<UserDataSources>(() => UserDataSourcesImpl1());
  sl.registerLazySingleton<WelcomeDataSource>(() => WelcomeDataSourcesImpl());
  sl.registerLazySingleton<ProfileDataSources>(() => ProfileDataSourcesImpl());
  sl.registerLazySingleton<DataSourcesMessages>(
      () => DataSourcesMessagesImpl());

  // Other dependencies or services can be registered here

  sl.registerLazySingleton(() => sl<FirebaseFirestore>());
  sl.registerLazySingleton(() => sl<FirebaseAuth>());
}
