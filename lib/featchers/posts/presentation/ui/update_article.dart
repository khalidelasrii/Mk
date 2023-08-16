import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/posts/presentation/ui/home_page.dart';

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

class UpdateArticle extends StatelessWidget {
  const UpdateArticle({
    super.key,
  });

  static const String screenRout = 'UpdateArticle';
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayote(
        disktopScafolde: UpdateArticleDisktop(),
        moubileSccafolde: UpdateArticleMobile());
  }
}

//! Add or update  Article pour mobile

class UpdateArticleMobile extends StatelessWidget {
  const UpdateArticleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
    );
  }
}

//! Add or update  Article pour Disktpo

class UpdateArticleDisktop extends StatefulWidget {
  const UpdateArticleDisktop({super.key});

  @override
  State<UpdateArticleDisktop> createState() => _UpdateArticleDisktopState();
}

class _UpdateArticleDisktopState extends State<UpdateArticleDisktop> {
  @override
  Widget build(BuildContext context) {
    void _validateInput(String value) {
      setState(() {
        _isInputValid = double.tryParse(value) != null;
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue,
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

        //! / ////////////////////////

        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fermer le dialogue
            },
            child: const Text('Annuler'),
          ),

          //! /////////////////////////////////
          ElevatedButton(
            onPressed: () {
              Article article = Article(
                id: '',
                article: '',
                name: '',
                prix: 3,
              );
              BlocProvider.of<AddordeletorupdateBloc>(context)
                  .add(UpdatArticleEvent(article: article));
              Navigator.pushNamed(context, HomePage.screenRout);
              // Fermer le dialogue

              BlocBuilder<AddordeletorupdateBloc, AddordeletorupdateState>(
                builder: (context, state) {
                  if (state is ErrorAddDeleteUpdateState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is SuccussAddDeleteUpdateState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Seccess')));
                  }
                  return const SizedBox();
                },
              );
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
