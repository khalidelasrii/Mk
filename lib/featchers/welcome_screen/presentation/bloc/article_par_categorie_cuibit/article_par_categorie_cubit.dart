import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/article_par_type_use_case.dart';

part 'article_par_categorie_state.dart';

class ArticleParCategorieCubit extends Cubit<ArticleParCategorieState> {
  ArticleParTypeUseCase articleParTypeUseCase;
  ArticleParCategorieCubit({required this.articleParTypeUseCase})
      : super(ArticleParCategorieInitial());

  getarticleParCategorieEvent(String collection) async {
    emit(ArticleParcatigorieLoadingState());
    final articlesOrfaillure = await articleParTypeUseCase.call(collection);
    print(collection);

    articlesOrfaillure.fold((_) {
      emit(const ArticleParCategorieErrorState(
          message: 'plaise try to refrech page'));
    }, (articlesliste) {
      emit(ArticleParCategorieIsLoadidState(articleList: articlesliste));
    });
  }
}
