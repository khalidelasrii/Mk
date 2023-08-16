import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/posts/presentation/ui/home_page.dart';

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

class AddArticle extends StatelessWidget {
  const AddArticle({super.key});
  static const String screenRout = 'AddArticle';
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayote(
        disktopScafolde: AddArticleDisktop(),
        moubileSccafolde: AddArticleMobile());
  }
}

//! Add or update  Article pour mobile

class AddArticleMobile extends StatelessWidget {
  const AddArticleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
    );
  }
}

//! Add or update  Article pour Disktpo

class AddArticleDisktop extends StatefulWidget {
  const AddArticleDisktop({super.key});

  @override
  State<AddArticleDisktop> createState() => _AddArticleDisktopState();
}

class _AddArticleDisktopState extends State<AddArticleDisktop> {
  @override
  Widget build(BuildContext context) {
    void _validateInput(String value) {
      setState(() {
        _isInputValid = double.tryParse(value) != null;
      });
    }

    return Scaffold(
      backgroundColor: Colors.green,
      body: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //! Name Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: Container(
                constraints: const BoxConstraints(minWidth: 500),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hoverColor: Colors.blue,
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color.fromARGB(255, 209, 194, 149),
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
            //! article Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: SizedBox(
                child: TextField(
                  controller: _articleController,
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
            //! Prix Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: SizedBox(
                child: TextField(
                  controller: _prixController,
                  onChanged: _validateInput,
                  decoration: InputDecoration(
                    hintText: _isInputValid
                        ? 'Prix'
                        : 'veuillez entrer une valeur valide exemple : 333.333',
                    filled: true,
                    fillColor: _isInputValid ? Colors.white : Colors.red,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                  ),
                  style: TextStyle(
                    color: _isInputValid ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fermer le dialogue
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              article = Article(
                id: '',
                article: _articleController.text,
                name: _nameController.text,
                prix: double.tryParse(_prixController.text) ?? 0,
              );

              BlocProvider.of<AddordeletorupdateBloc>(context)
                  .add(AddArticleEvent(article: article));
              Navigator.pushNamed(context, HomePage.screenRout);
              // Fermer le dialogue
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
