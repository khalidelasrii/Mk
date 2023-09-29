import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/core_widgets.dart';
import 'package:mk/core/responsive.dart';
import 'package:mk/core/snackbar_widget.dart';
import 'package:mk/featchers/Article/presentation/ui/home_page.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';

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
      backgroundColor: Colors.black,
      appBar: _myapbar(),
      body: _mybody(context, true),
    );
  }
}

class SingInMobile extends StatelessWidget {
  const SingInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _myapbar(),
      body: _mybody(context, false),
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

Widget _mybody(BuildContext context, bool isDisktop) {
  return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
    if (state is ErrorSingState) {
      SnackBarMessage()
          .showErrorSnackBar(message: state.message, context: context);
    } else if (state is IsSingInState) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }, builder: (context, state) {
    if (state is LodingAuthState) {
      FirebaseAuth.instance.authStateChanges().listen((User? usr) {
        if (usr != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        }
      });
      return const CerclulareLodingWidget();
    }
    return Center(
      child: Padding(
        padding: isDisktop == true
            ? const EdgeInsets.symmetric(horizontal: 150, vertical: 80)
            : const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          constraints: const BoxConstraints(minWidth: 300, minHeight: 300),
          child: isDisktop == true
              ? Row(
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
                          child: SingInField(
                            isDisktop: isDisktop,
                          ),
                        ))
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
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
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.black, Colors.blueAccent]),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                          ),
                          child: SingInField(
                            isDisktop: isDisktop,
                          ),
                        ))
                  ],
                ),
        ),
      ),
    );
  });
}
