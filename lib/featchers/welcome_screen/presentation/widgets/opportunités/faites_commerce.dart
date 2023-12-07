import 'package:flutter/material.dart';

class FaitesCommerce extends StatelessWidget {
  const FaitesCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "images/bck2.jpg",
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const TopStack(),
        ],
      ),
    );
  }
}

class TopStack extends StatelessWidget {
  const TopStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(59, 255, 255, 0),
      height: 500,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow[900],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  height: 300,
                  width: 400,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow[900],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  height: 300,
                  width: 400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
