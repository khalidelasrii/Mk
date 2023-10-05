import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/recherch_cuibit/recherch_cubit.dart';

// ...

class BardeRocherche {
  bardeRocherche(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        BlocProvider.of<RecherchCubit>(context).closeBoxRecherchEvent();
      },
      child: Stack(
        children: [
          //! la bare de recherche
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Container(
                        constraints: const BoxConstraints(maxWidth: 900),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: ' What are you looking for ?',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          onChanged: (value) {
                            if (value == "") {
                              BlocProvider.of<RecherchCubit>(context)
                                  .closeBoxRecherchEvent();
                            } else {
                              BlocProvider.of<RecherchCubit>(context)
                                  .recherchStatEvent(value);
                            }
                          },
                        )),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.lightBlue])),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //! le box de recherche

          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: BlocBuilder<RecherchCubit, RecherchState>(
              builder: (context, state) {
                if (state is RecherchStartstate) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 300,
                      constraints: const BoxConstraints(maxWidth: 860),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(181, 255, 214, 64),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: BlocBuilder<RecherchCubit, RecherchState>(
                        builder: (context, state) {
                          if (state is RecherchStartstate) {
                            return StreamBuilder(
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
                                  return const Center(child: Text('No Data'));
                                }
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
