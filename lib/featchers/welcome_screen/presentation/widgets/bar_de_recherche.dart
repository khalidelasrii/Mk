import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/toolbar_Cuibit/toolbar_cubit.dart';

class BarRocherche {
  barRocherche() {
    return BlocBuilder<ToolbarCubit, ToolbarState>(
      builder: (context, state) {
        if (state is ToolbarInitial) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '  What are you looking for ?',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      onChanged: (value) {
                        // Gérer les modifications du texte de recherche ici
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
