// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/domain/use_case/get_articles_use_case.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getArticlesUseCase;
  ArticleBloc({required this.getArticlesUseCase}) : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is GetAllArticlesEvent || event is RefreshArticlesEvent) {
        emit(LodingArticlesState());
        final faillureOrArticles = await getArticlesUseCase();
        faillureOrArticles.fold((faillure) {
          emit(ErrorArticlesState(message: _mapFailureTomessage(faillure)));
        }, (articles) {
          emit(LodedArticlesState(articles: articles));
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
