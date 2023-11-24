import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/users_welcome_screen/users_welcome_screen_cubit.dart';

class AutreProfileOption extends StatelessWidget {
  const AutreProfileOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersWelcomeScreenCubit, UsersWelcomeScreenState>(
        builder: (context, state) {
      return BlocBuilder<UsersWelcomeScreenCubit, UsersWelcomeScreenState>(
        builder: (context, state) {
          if (state is LodidUsersWelcomeState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.profiles.length,
              itemBuilder: (context, index) {
                return Text("Hello");
              },
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
