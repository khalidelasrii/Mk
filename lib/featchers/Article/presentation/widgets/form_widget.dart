import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/snackbar_widget.dart';

import '../../../Authontification/domain/entitie/user.dart';
import '../../domain/entitie/article.dart';
import '../bloc/add_delet_update/addordeletorupdate_bloc.dart';
import '../bloc/article/article_bloc.dart';
import '../ui/home_page.dart';

class FormWidget extends StatefulWidget {
  const FormWidget(
      {super.key, required this.isUpdate, this.article, required this.user});
  final bool isUpdate;
  final Article? article;
  final Usr user;
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
    widget.user;
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
        email: widget.user.email,
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
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(
                    user: widget.user,
                  )));
    } else {
      BlocProvider.of<AddordeletorupdateBloc>(context)
          .add(AddArticleEvent(article: article));
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
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField article ;
              if (_imageFile.isNotEmpty || _imageFile != '')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 400,
                    child: Image.memory(selectedImageInBytes!),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 200,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          // Calling pickImage Method

                          pickImage();
                        },
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.add), Text('Image')],
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //! Drope Down boton
              DropdownButton<String>(
                underline: const SizedBox(),
                isDense: true,
                icon: const Icon(Icons.more_horiz),
                elevation: 0,
                dropdownColor: const Color.fromARGB(101, 77, 61, 61),
                iconEnabledColor: Colors.white,
                items: const [
                  DropdownMenuItem(
                    value: 'Forniture',
                    child: Center(
                        child: Text(
                      'Forniture',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  DropdownMenuItem(
                    value: 'Livres',
                    child: Text('Livres'),
                  ),
                  DropdownMenuItem(
                    value: 'Stylo',
                    child: Text('Stylo'),
                  ),
                  DropdownMenuItem(
                    value: 'Cartables',
                    child: Text('Cartables'),
                  ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    typeArticle = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
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
            ]),
      ),
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
