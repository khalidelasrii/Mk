import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/shop_article_walet_use_case.dart';

part 'drawer_data_state.dart';

class DrawerDataCubit extends Cubit<DrawerDataState> {
  final ShopArticleWaletUseCase shopArticleWaletUseCase;

  DrawerDataCubit({required this.shopArticleWaletUseCase})
      : super(DrawerDataInitial());

  shoppingDrawerEvent() async {
    final articleOrfaillure = await shopArticleWaletUseCase();
    articleOrfaillure.fold((_) {
      emit(const ShoppingDrawerState(articles: []));
    }, ((r) {
      emit(ShoppingDrawerState(articles: r));
    }));
  }

  searchDrawerEvent() {
    emit(SearchDrawerState());
  }

  profileDrawerEvent() {
    emit(ProfileDrawerState());
  }

  drawerdataInitiale() {
    emit(DrawerDataInitial());
  }
}
