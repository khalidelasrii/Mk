import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';

import '../../../../Profile/presentation/page/profile_screen.dart';

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
              color: Colors.indigo,
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.profiles.length,
                itemBuilder: (context, index) {
                  final userfirestor = state.profiles[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProfileScreen(
                                      user: Usr(
                                          email: userfirestor.email,
                                          uid: userfirestor.uid,
                                          profileUrl: userfirestor.profileUrl ??
                                              'images/aa.jpg',
                                          name: userfirestor.name,
                                          phoneNumber:
                                              userfirestor.phoneNumber ?? ''),
                                    )));
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: ClipOval(
                                child: Container(
                              color: Colors.white,
                              width: 70,
                              height: 70,
                              child: const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                              ),
                            )),
                          ),
                          Text(
                            userfirestor.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
              color: Colors.indigo,
              width: double.infinity,
              height: 100,
            );
          }
        },
      );
    });
  }
}
