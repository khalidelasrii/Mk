import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/snackbar_widget.dart';
import 'package:mk/featchers/Article/presentation/ui/home_page.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'package:mk/featchers/Authontification/presentation/widget/sing_up_field.dart';

import '../../../welcome_screen/presentation/ui/welcome_screen_page.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
  return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
    if (state is ErrorSingState) {
      SnackBarMessage()
          .showErrorSnackBar(message: state.message, context: context);
    } else if (state is IsSingInState) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
  }, builder: (context, state) {
    if (state is LodingAuthState) {
      return const CerclulareLodingWidget();
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
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
                        child: SingUpField(),
                      ))
                ],
              )),
        ),
      );
    }
  });
}
