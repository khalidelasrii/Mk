import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_case/get_descusion_use_case.dart';

part 'descusion_state.dart';

class DescusionCubit extends Cubit<DescusionState> {
  GetDescusionUseCase getDescusionUseCase;

  DescusionCubit({required this.getDescusionUseCase})
      : super(DescusionInitial());

  getDescusionEvent() async {
    final descusionOrFailure = await getDescusionUseCase();
    descusionOrFailure.fold((l) {
      emit(ErrorDescusionState());
    }, (r) {
      emit(LodidDescusionState(descusions: r));
    });
  }
}
