import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/core/snackbar_widget.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';

import '../../../../core/Widgets/core_widgets.dart';
import '../../../Authontification/domain/entitie/user.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/form_widget.dart';

Article article = Article(article: '', name: '', prix: '', id: '', email: '');
final TextEditingController _nameController = TextEditingController();
final TextEditingController _articleController = TextEditingController();
final TextEditingController _prixController = TextEditingController();
@override
void dispose() {
  _nameController.dispose();
  _articleController.dispose();
  _prixController.dispose();
}

class AddOrUpdateArticle extends StatelessWidget {
  const AddOrUpdateArticle(
      {required this.user, super.key, this.article, required this.isUpdate});
  final Article? article;
  final bool isUpdate;
  final Usr user;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayote(
        disktopScafolde: AddOrUpdateArticleDisktop(
          isUpdate: isUpdate,
          article: article,
          user: user,
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
  final Usr user;
  const AddOrUpdateArticleDisktop(
      {super.key, this.article, required this.isUpdate, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? 'Update Poste' : 'Add Poste'),
      ),
      backgroundColor: Colors.green,
      body: _buildBody(context, user),
    );
  }

  //! Build body ;

  _buildBody(BuildContext context, Usr user) {
    return BlocConsumer<AddordeletorupdateBloc, AddordeletorupdateState>(
      listener: (context, state) {
        if (state is MessageAddDeleteUpdatePostState) {
          SnackBarMessage()
              .showSuccessSnackBar(message: state.message, context: context);
          BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
        } else if (state is ErrorAddDeleteUpdateState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        if (state is LodingAddDeleteUpdateArticleState) {
          return const CerclulareLodingWidget();
        }
        return FormWidget(
          user: user,
          isUpdate: isUpdate,
          article: isUpdate ? article : null,
          imagePicker: null,
        );
      },
    );
  }
}
