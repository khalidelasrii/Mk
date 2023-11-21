// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/use_case/addoorable_articles_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_all_article_usecase.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetAllArticleUseCase getAllArticleUseCase;
  final AddoorableArticlesUseCase addoorableArticlesUseCase;
  ArticleBloc(
      {required this.getAllArticleUseCase,
      required this.addoorableArticlesUseCase})
      : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is GetAllArticlesEvent) {
        final faillureOrArticles = await getAllArticleUseCase();
        faillureOrArticles.fold((faillure) {
          emit(const ErrorArticlesState(
              message: 'Error To get article try restart app'));
        }, (articles) {
          emit(LodedAllarticlesState(articles: articles));
        });
      } else if (event is AddoorlableArticlesEvent) {
        addoorableArticlesUseCase.call(event.article);
      }
    });
  }
}
