import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/snackbar_widget.dart';

import '../../domain/entitie/article.dart';
import '../bloc/add_delet_update/addordeletorupdate_bloc.dart';
import '../bloc/article/article_bloc.dart';
import '../ui/home_page.dart';

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

  String _imageFile = ''; // Variable to hold the selected image file
  Uint8List? selectedImageInBytes;
  String typeArticle = '';
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

  void validateFormthenUpdateOrAddArticle(
      Uint8List? selectedImageInBytes, String type) {
    final article = Article(
        type: type, //! add the type of objet her
        email: 'khalidox',
        article: _articleControlor.text,
        name: _nameControlor.text,
        prix: _prixControlor.text,
        id: _idControlor.text,
        selectedImageInBytes: selectedImageInBytes);

    if (widget.isUpdate) {
      BlocProvider.of<AddordeletorupdateBloc>(context)
          .add(UpdatArticleEvent(article: article));
      BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      BlocProvider.of<AddordeletorupdateBloc>(context)
          .add(AddArticleEvent(article: article));
      BlocProvider.of<ArticleBloc>(context).add(GetAllArticlesEvent());
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // TextField article ;

        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
            child: MaterialButton(
              onPressed: () {
                // Calling pickImage Method

                pickImage();
              },
              child: (_imageFile.isNotEmpty || _imageFile != '')
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 400,
                        child: Image.memory(selectedImageInBytes!),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: Image.asset(
                        'images/Ins.png',
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),

        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    color: Colors.white,
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Center(
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.abc,
                          color: Colors.transparent,
                        ),
                        hint: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Le Type de larticle',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        isDense: true,
                        dropdownColor: Colors.red,
                        items: const [
                          DropdownMenuItem(
                            value: 'Forniture',
                            child: Center(
                                child: Text(
                              'Forniture',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                          DropdownMenuItem(
                            value: 'Livres',
                            child: Center(
                                child: Text(
                              'Livres',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                          DropdownMenuItem(
                            value: 'Stylo',
                            child: Center(
                                child: Text(
                              'Stylo',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                          DropdownMenuItem(
                            value: 'Cartables',
                            child: Center(
                                child: Text(
                              'Cartables',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                          DropdownMenuItem(
                            value: 'Autres',
                            child: Center(
                                child: Text(
                              'Autres',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            typeArticle = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: SizedBox(
                    child: TextFormField(
                      controller: _articleControlor,
                      validator: (val) =>
                          val!.isEmpty ? "Can't be empty" : null,
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
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                // TextField article ;
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: SizedBox(
                    child: TextFormField(
                      controller: _nameControlor,
                      validator: (val) =>
                          val!.isEmpty ? "Can't be empty" : null,
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
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                // TextField prix ;
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: SizedBox(
                    child: TextFormField(
                      controller: _prixControlor,
                      validator: (val) =>
                          val!.isEmpty ? "Can't be empty" : null,
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
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
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
                        onPressed: () {
                          if (selectedImageInBytes == null) {
                            SnackBarMessage().showErrorSnackBar(
                                message: 'Error chose your image',
                                context: context);
                          } else {
                            validateFormthenUpdateOrAddArticle(
                                selectedImageInBytes, typeArticle);
                          }
                        },
                        child: widget.isUpdate
                            ? const Text('Update')
                            : const Text('Ajouter'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        //! Drope Down boton
      ]),
    );
  }

  // Method to pick image in flutter web
  Future<void> pickImage() async {
    try {
      // Pick image using file_picker package
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user picks an image, save selected image to variable
      if (fileResult != null) {
        setState(() {
          _imageFile = fileResult.files.first.name;
          selectedImageInBytes = fileResult.files.first.bytes;
        });
      }
    } catch (e) {
      // If an error occured, show SnackBar with error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error:$e")));
    }
  }
}
