import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toolbar_state.dart';

class ToolbarCubit extends Cubit<ToolbarState> {
  ToolbarCubit() : super(ToolbarInitial());
}
