import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';

// class LodedWidget extends StatelessWidget {
//   const LodedWidget({super.key, required this.articles});
//   final Stream<QuerySnapshot<Map<String, dynamic>>> articles;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: articles,
//       builder: (_, snapshot) {
       
//       },
//     );
//   }
// }


  //  Article artic = Article(
  //                                   article: article.article,
  //                                   name: article.name,
  //                                   prix: article.prix,
  //                                   id: article.id);
  //                               Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                       builder: (_) => AddOrUpdateArticle(
  //                                             isUpdate: true,
  //                                             article: artic,
  //                                           )));



       // BlocProvider.of<AddordeletorupdateBloc>(context)
                                //     .add(DelletArticleEvent(
                                //         articlId: article.id));