import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Widgets/bar_de_recherche.dart';
import '../bloc/toolbar_Cuibit/toolbar_cubit.dart';

class BarRocherche {
  barRocherche() {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is ToolbarInitial) {
          return BardeRocherche().bardeRocherche(context);
        }
        return const SizedBox();
      },
    );
  }
}
