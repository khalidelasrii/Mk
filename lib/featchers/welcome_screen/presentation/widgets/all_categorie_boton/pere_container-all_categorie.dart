import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'containers_in/ferst_Container.dart';
import 'containers_in/second_container.dart';
import 'containers_in/thert_container.dart';

sousListeCategorie(BuildContext context, int optionnbr, Color containerColor) {
  return MouseRegion(
    onEnter: (_) {
      BlocProvider.of<ToolbarCubit>(context).categorie1(optionnbr);
    },
    onExit: (_) {
      BlocProvider.of<ToolbarCubit>(context).isInitial();
    },
    child: Container(
        width: double.infinity,
        color: containerColor,
        constraints: const BoxConstraints(
          maxHeight: 300,
        ),
        child: Row(
          children: [
            //! La premier Container du categorie
            ferstContainer(),
            //! La deuxiem Container du premier categorie
            secondContainer(context),
            //!
            thertContainer(),
          ],
        )),
  );
}
