// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/use_case/get_articles_use_case.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getArticles;
  ArticleBloc({required this.getArticles}) : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is GetAllArticlesEvent || event is RefreshArticlesEvent) {
        emit(LodingArticlesState());
        final faillureOrArticles = await getArticles();
        faillureOrArticles.fold((faillure) {
          emit(ErrorArticlesState(message: _mapFailureTomessage(faillure)));
          print(_mapFailureTomessage(faillure));
        }, (articles) {
          emit(LodedArticlesState(articles: articles));
          print(articles);
        });
      }
    });
  }

  String _mapFailureTomessage(Faillure faillure) {
    switch (faillure.runtimeType) {
      case ServerFailure:
        return 'Server Faillure ,Plais try again later';
      default:
        return 'Unexpected error, please try again later';
    }
  }
}
