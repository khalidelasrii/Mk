import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/ui/home_page.dart';
import 'package:mk/featchers/Authontification/presentation/bloc/auth/auth_bloc.dart';
import 'package:mk/featchers/Authontification/presentation/ui/sing_in.dart';

class SingInField extends StatelessWidget {
  const SingInField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailControllor = TextEditingController();
    final passwordControllor = TextEditingController();

    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Create Account',
              style: TextStyle(color: Colors.white, fontSize: 20),
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
          ElevatedButton(
            onPressed: () async {
              BlocProvider.of<AuthBloc>(context).add(SingInEvent(
                  email: emailControllor.text,
                  password: passwordControllor.text));

              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const HomePage();
              }));
            },
            child: const Text('Connexion'),
          ),
        ],
      ),
    ));
  }
}
