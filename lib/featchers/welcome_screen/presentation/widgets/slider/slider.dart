import 'package:flutter/material.dart';

class SliderCarousel extends StatelessWidget {
  const SliderCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> dataliste = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipOval(
          child: Container(
            color: Colors.amber,
            child: const Icon(Icons.tag_faces_sharp),
          ),
        ),
      ),
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 50000),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            color: Colors.red,
            height: 300,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              height: 300,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataliste.length * 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return dataliste[index % dataliste.length];
                },
              ),
            ),
          ),
          Container(
            width: 50,
            height: 300,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
