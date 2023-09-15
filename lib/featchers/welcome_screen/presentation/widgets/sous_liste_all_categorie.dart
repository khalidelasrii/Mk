import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categorie_cheldren2_cuibit/categoriercheld2_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/mous_regeon.dart';

class SousListeAllCategorie {
  sousListeCategorie1(BuildContext context, Color containerColor) {
    return MouseRegion(
      onEnter: (_) {
        BlocProvider.of<ToolbarCubit>(context).categorie1(1);
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
              secondContainer(),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1000),
                  color: Colors.orange,
                  height: double.infinity,
                ),
              ),
            ],
          )),
    );
  }

  sousListeCategorie2(BuildContext context, Color containerColor) {
    return MouseRegion(
      onEnter: (_) {
        BlocProvider.of<ToolbarCubit>(context).categorie1(2);
      },
      onExit: (_) {},
      child: Container(
        width: double.infinity,
        color: containerColor,
        constraints: const BoxConstraints(maxHeight: 600, minHeight: 200),
      ),
    );
  }

  sousListeCategorie3(BuildContext context, Color containerColor) {
    return MouseRegion(
      onEnter: (_) {
        BlocProvider.of<ToolbarCubit>(context).categorie1(3);
      },
      onExit: (_) {},
      child: Container(
        width: double.infinity,
        color: containerColor,
        constraints: const BoxConstraints(maxHeight: 600, minHeight: 200),
      ),
    );
  }

  sousListeCategorie4(BuildContext context, Color containerColor) {
    return MouseRegion(
      onEnter: (_) {
        BlocProvider.of<ToolbarCubit>(context).categorie1(4);
      },
      onExit: (_) {},
      child: Container(
        width: double.infinity,
        color: containerColor,
        constraints: const BoxConstraints(maxHeight: 600, minHeight: 200),
      ),
    );
  }

  sousListeCategorie5(BuildContext context, Color containerColor) {
    return MouseRegion(
      onEnter: (_) {
        BlocProvider.of<ToolbarCubit>(context).categorie1(5);
      },
      onExit: (_) {},
      child: Container(
        width: double.infinity,
        color: containerColor,
        constraints: const BoxConstraints(maxHeight: 600, minHeight: 200),
      ),
    );
  }

  sousListeCategorie6(BuildContext context, Color containerColor) {
    return MouseRegion(
      onEnter: (_) {
        BlocProvider.of<ToolbarCubit>(context).categorie1(6);
      },
      onExit: (_) {},
      child: Container(
        width: double.infinity,
        color: containerColor,
        constraints: const BoxConstraints(maxHeight: 600, minHeight: 200),
      ),
    );
  }
}

ferstContainer() {
  mouseRegionFor1(Color color1, Color color2, Color color3, Color color4,
      Color color5, Color transpa) {
    const Color blackColor = Colors.black;
    return SingleChildScrollView(
      child: Column(children: [
        MousregionAllcategorie()
            .mouseRegionfor2(false, 1, 'group1b1', color1, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor2(false, 2, 'group1b2', color2, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor2(false, 3, 'group1b3', color3, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor2(false, 4, 'group1b4', color4, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor2(false, 5, 'group1b5', color5, blackColor)
      ]),
    );
  }

  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      color: Colors.blue,
      height: double.infinity,
      child: BlocBuilder<CategoriecheldrenCubit, CategoriecheldrenState>(
        builder: (context, state) {
          if (state is CategoriecheldrenInitial) {
            const Color trnaspacolor = Colors.transparent;
            return mouseRegionFor1(Colors.amber, trnaspacolor, trnaspacolor,
                trnaspacolor, trnaspacolor, trnaspacolor);
          } else if (state is CategorieChidlState1) {
            return mouseRegionFor1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidlState2) {
            return mouseRegionFor1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidlState3) {
            return mouseRegionFor1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidlState4) {
            return mouseRegionFor1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidlState5) {
            return mouseRegionFor1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          }
          return mouseRegionFor1(Colors.red, Colors.red, Colors.red, Colors.red,
              Colors.red, Colors.red);
        },
      ),
    ),
  );
}

secondContainer() {
  Grouo2b1(Color color1, Color color2, Color color3, Color color4, Color color5,
      Color transpa) {
    const Color blackColor = Colors.black;
    return SingleChildScrollView(
      child: Column(children: [
        MousregionAllcategorie()
            .mouseRegionfor3(false, 1, 'Group2b1', color1, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 2, 'Group2b1', color2, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 3, 'Group2b1', color3, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 4, 'Group2b1', color4, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 5, 'Group2b1', color5, blackColor)
      ]),
    );
  }

  Grouo2b2(Color color1, Color color2, Color color3, Color color4, Color color5,
      Color transpa) {
    const Color blackColor = Colors.black;
    return SingleChildScrollView(
      child: Column(children: [
        MousregionAllcategorie()
            .mouseRegionfor3(false, 1, 'Group2b2', color1, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 2, 'Group2b2', color2, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 3, 'Group2b2', color3, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 4, 'Group2b2', color4, blackColor),
        MousregionAllcategorie()
            .mouseRegionfor3(false, 5, 'Group2b2', color5, blackColor)
      ]),
    );
  }

  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      color: Colors.red,
      height: double.infinity,
      child: BlocBuilder<Categoriercheldren2Cubit, Categoriercheld2State>(
        builder: (context, state) {
          const Color trnaspa = Colors.transparent;
          if (state is Categoriercheld2Initial) {
            return Grouo2b1(
                Colors.amber, trnaspa, trnaspa, trnaspa, trnaspa, trnaspa);
          } else if (state is CategorieChidl2State1) {
            return Grouo2b1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidl2State2) {
            return Grouo2b1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidl2State3) {
            return Grouo2b1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidl2State4) {
            return Grouo2b1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidl2State5) {
            return Grouo2b1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          } else if (state is CategorieChidl2State6) {
            return Grouo2b1(state.color1, state.color2, state.color3,
                state.color4, state.color5, state.color6);
          }
          return Grouo2b1(
              Colors.amber, trnaspa, trnaspa, trnaspa, trnaspa, trnaspa);
        },
      ),
    ),
  );
}
