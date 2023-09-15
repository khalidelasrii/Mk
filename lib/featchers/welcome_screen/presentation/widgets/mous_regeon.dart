import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categorie_cheldren2_cuibit/categoriercheld2_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';

class MousregionAllcategorie {
  mouseRegionfor1(bool isin, int bontonNembr, String textBoton, Color color1,
      Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<ToolbarCubit>(context).categorie1(bontonNembr);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
              BlocProvider.of<ToolbarCubit>(context).isInitial();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: color1,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: color2,
                  ),
                  Text(
                    textBoton,
                    style: TextStyle(
                      color: color2,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ////
  mouseRegionfor2(bool isin, int bontonNembr, String textboton, Color color1,
      Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<CategoriecheldrenCubit>(context)
                  .ferstCategorieEvent(bontonNembr);
              BlocProvider.of<Categoriercheldren2Cubit>(context)
                  .ferstCategorieEvent(1);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: MaterialButton(
                color: color1,
                elevation: 0,
                onPressed: () {},
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        color: color2,
                      ),
                      Text(
                        textboton,
                        style: TextStyle(
                          color: color2,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }

  mouseRegionfor3(bool isin, int bontonNembr, String textBoton, Color color1,
      Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<Categoriercheldren2Cubit>(context)
                  .ferstCategorieEvent(bontonNembr);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: MaterialButton(
                color: color1,
                elevation: 0,
                onPressed: () {},
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        color: color2,
                      ),
                      Text(
                        textBoton,
                        style: TextStyle(
                          color: color2,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
