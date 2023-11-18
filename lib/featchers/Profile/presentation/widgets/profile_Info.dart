import 'package:flutter/cupertino.dart';

import '../page/profile_screen.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
        color: profilcolor,
      ),
    );
  }
}
