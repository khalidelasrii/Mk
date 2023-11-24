import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';

// ...

class BardeRocherche extends StatelessWidget {
  const BardeRocherche({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        BlocProvider.of<WelcomeArticleBlocBloc>(context)
            .add(WelcomeBlocInitialEvent());
      },
      child: Stack(
        children: [
          // //! le box de recherche

          BlocBuilder<WelcomeArticleBlocBloc, WelcomeArticleBlocState>(
            builder: (context, state) {
              if (state is RecherchStartstate) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        constraints:
                            const BoxConstraints(minWidth: 400, maxWidth: 800),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(181, 255, 214, 64),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            )),
                        child: MouseRegion(
                          onExit: (_) {
                            BlocProvider.of<WelcomeArticleBlocBloc>(context)
                                .add(WelcomeBlocInitialEvent());
                          },
                          child: SizedBox(
                            child: BlocBuilder<WelcomeArticleBlocBloc,
                                WelcomeArticleBlocState>(
                              builder: (context, state) {
                                if (state is RecherchStartstate) {
                                  return StreamBuilder<QuerySnapshot>(
                                    stream: state.value,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final document = snapshot.data!.docs;

                                        return ListView.builder(
                                          itemCount: document.length,
                                          itemBuilder: (context, index) {
                                            final doc = document[index];

                                            return MaterialButton(
                                              hoverColor: Colors.blueAccent,
                                              onPressed: () {},
                                              child: ListTile(
                                                leading: Image.network(
                                                  doc['articleUrl'],
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text(doc['name']),
                                                subtitle: Text(doc['article']),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return const Center(
                                            child: Text('No Data'));
                                      }
                                    },
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
