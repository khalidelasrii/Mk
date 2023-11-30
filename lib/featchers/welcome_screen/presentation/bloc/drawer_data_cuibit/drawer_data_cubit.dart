import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_data_state.dart';

class DrawerDataCubit extends Cubit<DrawerDataState> {
  DrawerDataCubit() : super(DrawerDataInitial());

  shoppingDrawerEvent() {
    emit(ShoppingDrawerState());
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
