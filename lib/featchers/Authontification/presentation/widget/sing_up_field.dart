import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entitie/user.dart';
import '../cubit/auth_cubit.dart';

class SingUpField extends StatefulWidget {
  const SingUpField({super.key});

  @override
  State<SingUpField> createState() => _SingUpFieldState();
}

class _SingUpFieldState extends State<SingUpField> {
  TextEditingController phoneControllor = TextEditingController();
  TextEditingController nameControllor = TextEditingController();
  TextEditingController emailControllor = TextEditingController();
  TextEditingController passwordControllor = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    phoneControllor.dispose();
    nameControllor.dispose();
    emailControllor.dispose();
    passwordControllor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Create Account',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Row(
                children: [
                  /// .............................................Name TextField

                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextField(
                          controller: nameControllor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hoverColor: Colors.blue,
                            hintText: 'User Name',
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Color.fromARGB(255, 209, 194, 149),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// .............................................Phone numbre

                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          controller: phoneControllor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hoverColor: Colors.blue,
                            hintText: 'Phone numbre',
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Color.fromARGB(255, 209, 194, 149),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// .............................................Email TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: SizedBox(
              child: TextField(
                controller: emailControllor,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hoverColor: Colors.blue,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 209, 194, 149),
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

          /// .............................................Password TextField

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: SizedBox(
              child: TextField(
                controller: passwordControllor,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hoverColor: Colors.blue,
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 209, 194, 149),
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

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: Colors.green),
                    onPressed: () {
                      print("${phoneControllor.text}_${nameControllor.text}");
                      BlocProvider.of<AuthCubit>(context).singUp(Usr(
                          phoneNumber: phoneControllor.text,
                          name: nameControllor.text,
                          email: emailControllor.text,
                          password: passwordControllor.text,
                          adress: '',
                          payes: ''));
                    },
                    child: const Text('Create'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.transparent),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).singGoogle();
                      },
                      child: SizedBox(
                        height: 40,
                        child: Image.asset('images/google.png'),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
