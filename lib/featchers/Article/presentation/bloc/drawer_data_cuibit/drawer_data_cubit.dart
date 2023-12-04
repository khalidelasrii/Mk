import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/use_case/add_article_in_walet_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/dellet_shop_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_shop_article_walet.dart';
import 'package:mk/featchers/Article/domain/use_case/shop_article_walet_use_case.dart';

part 'drawer_data_state.dart';

class DrawerDataCubit extends Cubit<DrawerDataState> {
  final ShopArticleWaletUseCase shopArticleWaletUseCase;
  final AddArticleInWaletUseCase addArticleInWaletUseCase;
  final GetShopArticleWaletUseCase getShopArticleWaletUseCase;
  final DelletShopArticleUseCase delletShopArticleUseCase;
  DrawerDataCubit(
      {required this.delletShopArticleUseCase,
      required this.shopArticleWaletUseCase,
      required this.getShopArticleWaletUseCase,
      required this.addArticleInWaletUseCase})
      : super(DrawerDataInitial());

  delletShopArtilceEvent(String articleId) async {
    await delletShopArticleUseCase(articleId);
    shopingPageEvent();
  }

  addArticleInWaleteEvent(Article article) async {
    await addArticleInWaletUseCase(article);
  }

  shopingPageEvent() async {
    emit(ShoppingDrawerPageState(articles: await getShopArticleWaletUseCase()));
  }

  shoppingDataDrawerEvent() async {
    emit(ShoppingDataState(articles: await shopArticleWaletUseCase()));
  }

  searchDrawerEvent() {
    emit(SearchDrawerState());
  }

  profileDrawerEvent() {
    emit(ProfileDrawerState());
  }
}
