import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categorie_cheldren2_cuibit/categoriercheld2_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/categoriecheldren_cuibit/categoriecheldren_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/appbar_welco.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/mous_regeon.dart';
import 'package:mk/featchers/welcome_screen/presentation/widgets/sous_liste_all_categorie.dart';
import 'package:mk/injection_container.dart' as di;

class WelcomeScreenTest extends StatefulWidget {
  const WelcomeScreenTest({super.key});

  @override
  State<WelcomeScreenTest> createState() => _WelcomeScreenTestState();
}

class _WelcomeScreenTestState extends State<WelcomeScreenTest> {
  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;
  Color color3 = Colors.transparent;

  Color color4 = Colors.transparent;

  Color color5 = Colors.transparent;

  Color color6 = Colors.transparent;
  Color colortranst = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<ToolbarCubit>()),
          BlocProvider(create: (context) => di.sl<CategoriecheldrenCubit>()),
          BlocProvider(create: (context) => di.sl<Categoriercheldren2Cubit>()),
        ],
        child: Scaffold(
            backgroundColor: const Color.fromARGB(183, 0, 0, 0),
            // appBar: _buildAppbar(),
            body: _buildbody()));
  }

  _buildbody() {
    return SingleChildScrollView(
        child: Column(children: [
      Stack(children: [
        Container(
          color: Colors.black,
          height: 500,
          width: double.infinity,
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'images/bck.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            //! Appbar Widget
            BlocBuilder<ToolbarCubit, ToolbarState>(
              builder: (context, state) {
                if (state is AppbarfesrtState) {
                  return AppbarWelcom()
                      .appbarwelcom(context, state.color1, state.color2);
                } else if (state is CategorieState1 ||
                    state is CategorieState2 ||
                    state is CategorieState3 ||
                    state is CategorieState4 ||
                    state is CategorieState5 ||
                    state is CategorieState6) {
                  return AppbarWelcom()
                      .appbarwelcom(context, Colors.white, Colors.amber);
                }
                return AppbarWelcom()
                    .appbarwelcom(context, Colors.transparent, Colors.white);
              },
            ),

            //! Les Boton de tous les categorie

            BlocBuilder<ToolbarCubit, ToolbarState>(
              builder: (context, state) {
                Container categorieIs(Color c1, Color c2, Color c3, Color c4,
                    Color c5, Color c6, Color tran, Color contaiColor) {
                  return Container(
                      color: contaiColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MousregionAllcategorie().mouseRegionfor1(
                              false, 1, 'All Categorie', c1, tran),
                          MousregionAllcategorie()
                              .mouseRegionfor1(false, 2, ' option 1', c2, tran),
                          MousregionAllcategorie()
                              .mouseRegionfor1(false, 3, 'option 2', c3, tran),
                          const SizedBox(
                            width: 20,
                          ),
                          MousregionAllcategorie()
                              .mouseRegionfor1(false, 4, 'option 3', c4, tran),
                          MousregionAllcategorie()
                              .mouseRegionfor1(false, 5, 'option 4', c5, tran),
                          MousregionAllcategorie()
                              .mouseRegionfor1(false, 6, 'option 5', c6, tran),
                        ],
                      ));
                }

                if (state is ToolbarInitial) {
                  return categorieIs(color1, color2, color3, color4, color5,
                      color6, colortranst, Colors.transparent);
                } else if (state is CategorieState1) {
                  return categorieIs(
                      state.color1,
                      state.color2,
                      state.color3,
                      state.color4,
                      state.color5,
                      state.color6,
                      Colors.black,
                      colortranst);
                } else if (state is CategorieState2) {
                  return categorieIs(
                      state.color1,
                      state.color2,
                      state.color3,
                      state.color4,
                      state.color5,
                      state.color6,
                      Colors.black,
                      colortranst);
                } else if (state is CategorieState3) {
                  return categorieIs(
                      state.color1,
                      state.color2,
                      state.color3,
                      state.color4,
                      state.color5,
                      state.color6,
                      Colors.black,
                      colortranst);
                } else if (state is CategorieState4) {
                  return categorieIs(
                      state.color1,
                      state.color2,
                      state.color3,
                      state.color4,
                      state.color5,
                      state.color6,
                      Colors.black,
                      colortranst);
                } else if (state is CategorieState5) {
                  return categorieIs(
                      state.color1,
                      state.color2,
                      state.color3,
                      state.color4,
                      state.color5,
                      state.color6,
                      Colors.black,
                      colortranst);
                } else if (state is CategorieState6) {
                  return categorieIs(
                      state.color1,
                      state.color2,
                      state.color3,
                      state.color4,
                      state.color5,
                      state.color6,
                      Colors.black,
                      colortranst);
                }
                return categorieIs(color1, color2, color3, color4, color5,
                    color6, colortranst, Colors.transparent);
              },
            ),
            //!   la Sous liste du Catégorie:

            BlocBuilder<ToolbarCubit, ToolbarState>(
              builder: (context, state) {
                if (state is CategorieState1) {
                  return SousListeAllCategorie()
                      .sousListeCategorie1(context, Colors.amber);
                } else if (state is CategorieState2) {
                  return SousListeAllCategorie()
                      .sousListeCategorie2(context, Colors.red);
                } else if (state is CategorieState3) {
                  return SousListeAllCategorie()
                      .sousListeCategorie3(context, Colors.green);
                } else if (state is CategorieState4) {
                  return SousListeAllCategorie()
                      .sousListeCategorie4(context, Colors.blue);
                } else if (state is CategorieState5) {
                  return SousListeAllCategorie()
                      .sousListeCategorie5(context, Colors.pink);
                } else if (state is CategorieState6) {
                  return SousListeAllCategorie()
                      .sousListeCategorie6(context, Colors.deepOrange);
                }
                return const SizedBox();
              },
            ),
            //! La bar de recherche :
            BlocBuilder<ToolbarCubit, ToolbarState>(
              builder: (context, state) {
                if (state is ToolbarInitial) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText:
                                    '           What are you looking for ?',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                              ),
                              onChanged: (value) {
                                // Gérer les modifications du texte de recherche ici
                              },
                            )),
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.lightBlue])),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        )
      ]),
    ]));
  }
}
