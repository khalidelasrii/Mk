import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Authontification/domain/entitie/user.dart';
import '../../domain/entitie/article.dart';
import '../bloc/add_delet_update/addordeletorupdate_bloc.dart';
import '../bloc/article/article_bloc.dart';
import '../ui/home_page.dart';

class FormWidget extends StatefulWidget {
  const FormWidget(
      {super.key,
      required this.imagePicker,
      required this.isUpdate,
      this.article,
      required this.user});
  final bool isUpdate;
  final Article? article;
  final Usr user;
  final XFile? imagePicker;
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
    widget.user;
    if (widget.isUpdate) {
      _articleControlor.text = widget.article!.article;
      _prixControlor.text = widget.article!.prix.toString();
      _nameControlor.text = widget.article!.name;
      _idControlor.text = widget.article!.id;
    }
    super.initState();
  }

  void validateFormthenUpdateOrAddArticle() {
    final article = Article(
        email: widget.user.email,
        article: _articleControlor.text,
        name: _nameControlor.text,
        prix: _prixControlor.text,
        id: _idControlor.text);

    if (widget.isUpdate) {
      BlocProvider.of<AddordeletorupdateBloc>(context)
          .add(UpdatArticleEvent(article: article));
      BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(
                    user: widget.user,
                  )));
    } else {
      BlocProvider.of<AddordeletorupdateBloc>(context)
          .add(AddArticleEvent(article: article, image: widget.imagePicker));
      BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(
                    user: widget.user,
                  )));
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
            ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [Text('Image'), Icon(Icons.add)],
                )),
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
