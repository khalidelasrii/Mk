import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entitie/welcome_article.dart';
import '../../../domain/use_case/article_par_type_use_case.dart';
import '../../../domain/use_case/get_all_welcome_article_use_case.dart';
import '../../../domain/use_case/search_results_use_case.dart';

part 'welcome_article_bloc_event.dart';
part 'welcome_article_bloc_state.dart';

class WelcomeArticleBlocBloc
    extends Bloc<WelcomeArticleBlocEvent, WelcomeArticleBlocState> {
  SearchResultsUseCase searchResultsUseCase;
  GetAllWelcomeArticleUseCase getAllWelcomeArticleUseCase;
  ArticleParTypeUseCase articleParTypeUseCase;

  WelcomeArticleBlocBloc(
      {required this.articleParTypeUseCase,
      required this.searchResultsUseCase,
      required this.getAllWelcomeArticleUseCase})
      : super(WelcomeArticleBlocInitial()) {
    on<WelcomeArticleBlocEvent>((event, emit) async {
      if (event is WelcomeBlocInitialEvent) {
        emit(WelcomeArticleBlocInitial());
      } else if (event is RecherchStatEvent) {
        emit(RecherchStartstate(await searchResultsUseCase(event.value)));
      } else if (event is AdoorArticlesloadingEvent) {
        final addrarticlesOrfaillur = await getAllWelcomeArticleUseCase();
        addrarticlesOrfaillur.fold((_) {
          emit(WelcomeArticleBlocInitial());
        }, (listArticle) {
          emit(LodidAdorArticlesState(articles: listArticle));
        });
      } else if (event is GetarticleParCategorieEvent) {
        final articlesOrfaillure =
            await articleParTypeUseCase(event.collection);

        articlesOrfaillure.fold((_) {
          emit(WelcomeArticleBlocInitial());
        }, (articlesliste) {
          emit(ArticleParCategorieIsLoadidState(articleList: articlesliste));
        });
      }
    });
  }
}
