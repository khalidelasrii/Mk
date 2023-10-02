import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/profile/domain/profile_use_case/get_mes_article_use_case.dart';

part 'get_mes_articles_state.dart';

class GetMesArticlesCubit extends Cubit<GetMesArticlesState> {
  GetMesArticlesUSeCase getMesArticlesUSeCase;
  GetMesArticlesCubit({required this.getMesArticlesUSeCase})
      : super(GetMesArticlesInitial());

  mesArticleLoding(String email) async {
    emit(LodingMesArticlesState());

    final mesArticlesOrFaillure = await getMesArticlesUSeCase.call(email);

    mesArticlesOrFaillure.fold((_) => emit(ErrorMesArticlesState()),
        (artii) => emit(LodidMesArticlesState(articles: artii)));
  }
}
