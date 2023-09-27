import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/article_par_categorie_cuibit/article_par_categorie_cubit.dart';

import '../widgets/appbar_welcom.dart';
import '../widgets/article_categorie_page_widget.dart/article_par_categorie.dart';

class ArticleCategoriePage extends StatelessWidget {
  const ArticleCategoriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppbarWelcom().appbarwelcom(context, Colors.white, Colors.blue),
        Expanded(
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 250,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    child: BlocBuilder<ArticleParCategorieCubit,
                        ArticleParCategorieState>(builder: (context, state) {
                      if (state is ArticleParCategorieIsLoadidState) {
                        return ArticleParCategorieWidget()
                            .secoundContainer(context, state.articleList);
                      }
                      return const CerclulareLodingWidget();
                    }),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
