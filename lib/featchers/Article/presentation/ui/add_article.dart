import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/const_widget/my_colors.dart';

import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';

import '../../../../core/const_widget/core_widgets.dart';
import '../../../../core/const_widget/snackbar_widget.dart';
import '../bloc/article/article_bloc.dart';
import '../widgets/form_widget.dart';

class AddOrUpdateArticle extends StatefulWidget {
  const AddOrUpdateArticle(
      {super.key, this.article, required this.user, required this.isUpdate});
  final Article? article;
  final bool isUpdate;
  final User? user;

  @override
  State<AddOrUpdateArticle> createState() => _AddOrUpdateArticleState();
}

class _AddOrUpdateArticleState extends State<AddOrUpdateArticle> {
  @override
  Widget build(BuildContext context) {
    return AddOrUpdateArticleDisktop(
      isUpdate: widget.isUpdate,
      article: widget.article,
      user: widget.user,
    );
  }
}

class AddOrUpdateArticleDisktop extends StatelessWidget {
  final Article? article;
  final bool isUpdate;
  final User? user;
  const AddOrUpdateArticleDisktop(
      {super.key, this.article, required this.isUpdate, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? 'Update Poste' : 'Add Poste'),
      ),
      backgroundColor: mybluebackgroundcolor,
      body: _buildBody(context, user),
    );
  }

  //! Build body ;

  _buildBody(BuildContext context, User? user) {
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
          isUpdate: isUpdate,
          article: isUpdate ? article : null,
          user: user,
        );
      },
    );
  }
}
