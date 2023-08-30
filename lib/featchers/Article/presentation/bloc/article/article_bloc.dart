// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/use_case/get_articles_use_case.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getArticles;
  ArticleBloc({required this.getArticles}) : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is GetAllArticlesEvent) {
        emit(LodingArticlesState());
        final faillureOrArticles = await getArticles();

        faillureOrArticles.fold((faillure) {
          emit(const ErrorArticlesState(
              message: 'Error To get article try restart app'));
        }, (articles) {
          emit(LodedArticlesState(articles: articles));
        });
      }
    });
  }
}
