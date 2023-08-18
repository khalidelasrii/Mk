import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/core/utile.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/home_page.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../widgets/form_widget.dart';

Article article = Article(article: '', name: '', prix: 0, id: '');
final TextEditingController _nameController = TextEditingController();
final TextEditingController _articleController = TextEditingController();
final TextEditingController _prixController = TextEditingController();
bool _isInputValid = true;
@override
void dispose() {
  _nameController.dispose();
  _articleController.dispose();
  _prixController.dispose();
}

class AddOrUpdateArticle extends StatelessWidget {
  const AddOrUpdateArticle({super.key, this.article, required this.isUpdate});
  final Article? article;
  final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayote(
        disktopScafolde: AddOrUpdateArticleDisktop(
          isUpdate: isUpdate,
          article: article,
        ),
        moubileSccafolde: AddORUpdateArticleMobile(
          isUpdate: isUpdate,
          article: article,
        ));
  }
}

//! Add or update  Article pour mobile

class AddORUpdateArticleMobile extends StatelessWidget {
  const AddORUpdateArticleMobile(
      {super.key, this.article, required this.isUpdate});
  final Article? article;
  final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
    );
  }
}

//! Add or update  Article pour Disktpo

class AddOrUpdateArticleDisktop extends StatelessWidget {
  final Article? article;
  final bool isUpdate;
  const AddOrUpdateArticleDisktop(
      {super.key, this.article, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? 'Update Poste' : 'Add Poste'),
      ),
      backgroundColor: Colors.green,
      body: _buildBody(context, article),
    );
  }

  //! Build body ;

  _buildBody(BuildContext context, Article? artic) {
    return BlocConsumer<AddordeletorupdateBloc, AddordeletorupdateState>(
      listener: (context, state) {
        if (state is MessageAddDeleteUpdatePostState) {
          SnackBarMessage()
              .showSuccessSnackBar(message: state.message, context: context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false);
        } else if (state is ErrorAddDeleteUpdateState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        if (state is LodingAddDeleteUpdateArticleState) {
          return const LowdingWidget();
        }
        return FormWidget(
          isUpdate: isUpdate,
          article: isUpdate ? article : null,
        );
      },
    );
  }
}
