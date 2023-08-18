import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entitie/article.dart';
import '../bloc/add_delet_update/addordeletorupdate_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.isUpdate, this.article});
  final bool isUpdate;
  final Article? article;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _articleControlor = TextEditingController();
  final TextEditingController _prixControlor = TextEditingController();
  final TextEditingController _nameControlor = TextEditingController();
  final TextEditingController _idControlor = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      _articleControlor.text = widget.article!.article;
      _prixControlor.text = widget.article!.prix.toString();
      _nameControlor.text = widget.article!.name;
      _idControlor.text = widget.article!.id;
    }
    super.initState();
  }

  void validateFormthenUpdateOrAddArticle() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final article = Article(
          article: _articleControlor.text,
          name: _nameControlor.text,
          prix: double.tryParse(_prixControlor.text) ?? 00,
          id: _idControlor.text);

      if (widget.isUpdate) {
        BlocProvider.of<AddordeletorupdateBloc>(context)
            .add(UpdatArticleEvent(article: article));
      } else {
        BlocProvider.of<AddordeletorupdateBloc>(context)
            .add(AddArticleEvent(article: article));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField article ;
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: SizedBox(
                child: TextFormField(
                  controller: _articleControlor,
                  validator: (val) => val!.isEmpty ? "Can't be empty" : null,
                  decoration: const InputDecoration(
                    hoverColor: Colors.blue,
                    hintText: 'Article',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            // TextField article ;
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: SizedBox(
                child: TextFormField(
                  controller: _nameControlor,
                  validator: (val) => val!.isEmpty ? "Can't be empty" : null,
                  decoration: const InputDecoration(
                    hoverColor: Colors.blue,
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            // TextField prix ;
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: SizedBox(
                child: TextFormField(
                  controller: _prixControlor,
                  validator: (val) => val!.isEmpty ? "Can't be empty" : null,
                  decoration: const InputDecoration(
                    hoverColor: Colors.blue,
                    hintText: 'Prix',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Fermer le dialogue
                    },
                    child: const Text('Annuler'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: validateFormthenUpdateOrAddArticle,
                    child: widget.isUpdate
                        ? const Text('Update')
                        : const Text('Ajouter'),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
