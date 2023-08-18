//  StatefulBuilder(
//     builder: (context, setState) {
//       void _validateInput(String value) {
//         setState(() {
//           _isInputValid = double.tryParse(value) != null;
//         });
//       }

//       return AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             //! Name Field
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//               child: Container(
//                 constraints: const BoxConstraints(minWidth: 500),
//                 child: TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(
//                     hoverColor: Colors.blue,
//                     hintText: 'Name',
//                     hintStyle: TextStyle(color: Colors.black),
//                     filled: true,
//                     fillColor: Color.fromARGB(255, 209, 194, 149),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             //! article Field
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//               child: SizedBox(
//                 child: TextField(
//                   controller: _articleController,
//                   decoration: const InputDecoration(
//                     hoverColor: Colors.blue,
//                     hintText: 'Article',
//                     hintStyle: TextStyle(color: Colors.black),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             //! Prix Field
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//               child: SizedBox(
//                 child: TextField(
//                   controller: _prixController,
//                   onChanged: _validateInput,
//                   decoration: InputDecoration(
//                     hintText: _isInputValid
//                         ? 'Prix'
//                         : 'veuillez entrer une valeur valide exemple : 333.333',
//                     filled: true,
//                     fillColor: _isInputValid ? Colors.white : Colors.red,
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 1),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 2),
//                     ),
//                   ),
//                   style: TextStyle(
//                     color: _isInputValid ? Colors.black : Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Fermer le dialogue
//             },
//             child: const Text('Annuler'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               article = Article(
//                 id: '',
//                 article: _articleController.text,
//                 name: _nameController.text,
//                 prix: double.tryParse(_prixController.text) ?? 0,
//               );

//               BlocProvider.of<AddordeletorupdateBloc>(context)
//                   .add(AddArticleEvent(article: article));
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => const HomePage()));
//               // Fermer le dialogue
//             },
//             child: const Text('Ajouter'),
//           ),
//         ],
//       );
//     },
//   );