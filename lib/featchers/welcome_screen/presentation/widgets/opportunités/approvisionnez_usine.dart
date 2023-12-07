import 'package:flutter/material.dart';

class ApprovisionnezUsine extends StatelessWidget {
  const ApprovisionnezUsine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  constraints:
                      const BoxConstraints(maxHeight: 400, maxWidth: 400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  constraints:
                      const BoxConstraints(maxHeight: 400, maxWidth: 400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  constraints:
                      const BoxConstraints(maxHeight: 400, maxWidth: 400),
                ),
              ),
            ],
          ),
        ));
  }
}
