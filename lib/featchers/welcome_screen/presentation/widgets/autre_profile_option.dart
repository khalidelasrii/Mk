import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';

class AutreProfileOption extends StatefulWidget {
  const AutreProfileOption({super.key});

  @override
  State<AutreProfileOption> createState() => _AutreProfileOptionState();
}

class _AutreProfileOptionState extends State<AutreProfileOption> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersWelcomeScreenCubit>(context).getUsersEvent();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersWelcomeScreenCubit, UsersWelcomeScreenState>(
        builder: (context, state) {
      return BlocBuilder<UsersWelcomeScreenCubit, UsersWelcomeScreenState>(
        builder: (context, state) {
          if (state is LodidUsersWelcomeState) {
            return Container(
              width: double.infinity,
              height: 100,
              color: Colors.amber,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.profiles.length,
                itemBuilder: (context, index) {
                  final userfirestor = state.profiles[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ClipOval(
                                child: Center(
                              child: Image.asset(
                                'images/aa.jpg',
                                width: 80,
                                height: 80,
                              ),
                            )),
                          ),
                          Text(userfirestor.name!),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
              color: Colors.amber,
              width: double.infinity,
              height: 33,
            );
          }
        },
      );
    });
  }
}
