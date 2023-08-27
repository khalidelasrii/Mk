import 'package:flutter/material.dart';
import 'package:mk/core/responsive.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayote(
        disktopScafolde: SingUpDeskTop(), moubileSccafolde: SingUpMobile());
  }
}

class SingUpDeskTop extends StatelessWidget {
  const SingUpDeskTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: _myapbar(),
      body: _mybody(),
    );
  }
}

class SingUpMobile extends StatelessWidget {
  const SingUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: _myapbar(),
      body: _mybody(),
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

Widget _mybody() {
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
                  // child: const SingInField(),
                ))
          ],
        ),
      ),
    ),
  );
}
