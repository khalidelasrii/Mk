import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/featchers/Article/presentation/ui/home_page.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_up.dart';

import '../../domain/entitie/user.dart';
import '../widget/sign_in_field.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
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
      appBar: _myapbar(),
      body: _mybody(context),
    );
  }
}

class SingInMobile extends StatelessWidget {
  const SingInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: _myapbar(),
      body: _mybody(context),
    );
  }
}

AppBar _myapbar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      children: [
        SizedBox(
          height: 40,
          child: Image.asset('images/MK.png'),
        )
      ],
    ),
  );
}

Widget _mybody(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 80),
      child: Container(
        constraints: const BoxConstraints(minWidth: 300, minHeight: 300),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                child: Image.asset("images/logo.gif"),
              ),
            ),
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
                  child: SingInField(),
                ))
          ],
        ),
      ),
    ),
  );
}
