// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/use_case/addoorable_articles_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_all_article_usecase.dart';
import 'package:mk/featchers/Article/domain/use_case/get_articles_use_case.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getArticles;
  final GetAllArticleUseCase getAllArticleUseCase;
  final AddoorableArticlesUseCase addoorableArticlesUseCase;
  ArticleBloc(
      {required this.getArticles,
      required this.getAllArticleUseCase,
      required this.addoorableArticlesUseCase})
      : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is GetMesArticleEvent) {
        emit(LodingArticlesState());
        final faillureOrArticles = await getArticles();

        faillureOrArticles.fold((faillure) {
          emit(const ErrorArticlesState(
              message: 'Error To get article try restart app'));
        }, (articles) {
          emit(LodedArticlesState(articles: articles));
        });
      } else if (event is GetAllArticlesEvent) {
        emit(LodingArticlesState());
        final faillureOrArticles = await getAllArticleUseCase();

        faillureOrArticles.fold((faillure) {
          emit(const ErrorArticlesState(
              message: 'Error To get article try restart app'));
        }, (articles) {
          emit(LodedAllarticles(articles: articles));
        });
      } else if (event is AddoorlableArticlesEvent) {
        addoorableArticlesUseCase.call(event.article);
      }
    });
  }
}
