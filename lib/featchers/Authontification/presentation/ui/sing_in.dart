import 'package:flutter/material.dart';
import 'package:mk/core/responsive.dart';

import '../widget/sign_in_field.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayote(
        disktopScafolde: SingInDeskTop(), moubileSccafolde: SingInMobile());
  }
}

class SingInDeskTop extends StatelessWidget {
  const SingInDeskTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 80),
          child: Container(
            constraints: const BoxConstraints(minWidth: 300, minHeight: 300),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                        child: const Icon(Icons.abc))),
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.blueAccent]),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                      ),
                      child: const SingInField(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingInMobile extends StatelessWidget {
  const SingInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
