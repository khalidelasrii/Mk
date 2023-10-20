import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/use_case/get_mes_article_use_case.dart';

part 'get_mes_articles_state.dart';

class GetMesArticlesCubit extends Cubit<GetMesArticlesState> {
  GetMesArticlesUSeCase getMesArticlesUSeCase;
  GetMesArticlesCubit({required this.getMesArticlesUSeCase})
      : super(GetMesArticlesInitial());

  mesArticleLoding() async {
    emit(LodingMesArticlesState());

    final mesArticlesOrFaillure = await getMesArticlesUSeCase();

    mesArticlesOrFaillure.fold((_) {
      emit(ErrorMesArticlesState());
    }, (artii) {
      emit(LodidMesArticlesState(articles: artii));
    });
  }
}
