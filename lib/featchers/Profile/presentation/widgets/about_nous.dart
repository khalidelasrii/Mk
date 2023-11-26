import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Authontification/presentation/cubit/auth_cubit.dart';
import '../../../welcome_screen/presentation/ui/welcome_screen_page.dart';
import '../page/profile_screen.dart';

class AboutNous extends StatelessWidget {
  const AboutNous({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: myblue,
        child: MaterialButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).singOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()));
          },
          child: Container(
              color: Colors.amber,
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Deconection',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
