import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/nbr_vu_use_case.dart';

import '../../../domain/use_case/get_descusion_use_case.dart';

part 'descusion_state.dart';

class DescusionCubit extends Cubit<DescusionState> {
  GetDescusionUseCase getDescusionUseCase;
  NbrVuUseCase nbrVuUseCase;

  DescusionCubit(
      {required this.getDescusionUseCase, required this.nbrVuUseCase})
      : super(DescusionInitial());

  getDescusionEvent() async {
    final descusionOrFailure = await getDescusionUseCase();
    descusionOrFailure.fold((l) {
      emit(ErrorDescusionState());
    }, (r) {
      emit(LodidDescusionState(descusions: r));
    });
  }

  nbrMessageVu(Messages messages) async {
    nbrVuUseCase(messages);
  }
}
