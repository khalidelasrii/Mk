import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/adoor_articles_cuibit/adoor_articles_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';

import '../../../bloc/secondcont_cuibit/secoundcont_cubit.dart';

class ContainerBotons {
  ferstContainerBoton(bool isin, int bontonNembr, String textBoton,
      Color color1, Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<CategoriecheldrenCubit>(context)
                  .ferstCategorieEvent(bontonNembr);
              if (bontonNembr == 1) {
                BlocProvider.of<SecoundcontCubit>(context).ferstGroupEvent(1);
              } else if (bontonNembr == 2) {
                BlocProvider.of<SecoundcontCubit>(context).secoundGroupEvent(1);
              } else if (bontonNembr == 3) {
                BlocProvider.of<SecoundcontCubit>(context).thertGroupEvent(1);
              } else if (bontonNembr == 4) {
                BlocProvider.of<SecoundcontCubit>(context).forthGroupEvent(1);
              } else if (bontonNembr == 5) {
                BlocProvider.of<SecoundcontCubit>(context).fiftGroupEvent(1);
              }
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
              BlocProvider.of<CategoriecheldrenCubit>(context)
                  .ferstCategorieEvent(bontonNembr);

              if (bontonNembr == 1) {
                BlocProvider.of<SecoundcontCubit>(context).ferstGroupEvent(1);
              } else if (bontonNembr == 2) {
                BlocProvider.of<SecoundcontCubit>(context).secoundGroupEvent(1);
              } else if (bontonNembr == 3) {
                BlocProvider.of<SecoundcontCubit>(context).thertGroupEvent(1);
              } else if (bontonNembr == 4) {
                BlocProvider.of<SecoundcontCubit>(context).forthGroupEvent(1);
              } else if (bontonNembr == 5) {
                BlocProvider.of<SecoundcontCubit>(context).fiftGroupEvent(1);
              }
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
                  ),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                  )),
                  Icon(
                    Icons.trending_neutral_sharp,
                    color: color2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  secoundContainerBotonFerstGroup(bool isin, int bontonNembr, String textBoton,
      Color color1, Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<SecoundcontCubit>(context)
                  .ferstGroupEvent(bontonNembr);
              //!
              BlocProvider.of<AdoorArticlesCubit>(context)
                  .adoorArticlesloadingEvent();
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
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
                  ),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                  )),
                  Icon(
                    Icons.trending_neutral_sharp,
                    color: color2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  secoundContainerBotonSecoundGroup(bool isin, int bontonNembr,
      String textBoton, Color color1, Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<SecoundcontCubit>(context)
                  .secoundGroupEvent(bontonNembr);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
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
                  ),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                  )),
                  Icon(
                    Icons.trending_neutral_sharp,
                    color: color2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  secoundContainerBotonThertGroup(bool isin, int bontonNembr, String textBoton,
      Color color1, Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<SecoundcontCubit>(context)
                  .thertGroupEvent(bontonNembr);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
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
                  ),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                  )),
                  Icon(
                    Icons.trending_neutral_sharp,
                    color: color2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  secoundContainerBotonForthGroup(bool isin, int bontonNembr, String textBoton,
      Color color1, Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<SecoundcontCubit>(context)
                  .forthGroupEvent(bontonNembr);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
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
                  ),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                  )),
                  Icon(
                    Icons.trending_neutral_sharp,
                    color: color2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  secoundContainerBotonFiftGroup(bool isin, int bontonNembr, String textBoton,
      Color color1, Color color2) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
              BlocProvider.of<SecoundcontCubit>(context)
                  .fiftGroupEvent(bontonNembr);
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
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
                  ),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                  )),
                  Icon(
                    Icons.trending_neutral_sharp,
                    color: color2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
