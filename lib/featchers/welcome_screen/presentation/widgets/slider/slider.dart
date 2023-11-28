import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderCrusur extends StatelessWidget {
  const SliderCrusur({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'images/slider/2.jpg',
      'images/slider/3.jpg',
      'images/slider/4.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 32 / 5, // Rapport largeur-hauteur des images
        enlargeCenterPage: true, // Agrandit la page actuellement centrée
        enableInfiniteScroll: true, // Défilement infini
        autoPlay: true, // Lecture automatique
        autoPlayInterval:
            const Duration(seconds: 3), // Intervalle de lecture automatique
        autoPlayAnimationDuration: const Duration(
            milliseconds: 800), // Durée de l'animation de lecture automatique
        autoPlayCurve:
            Curves.fastOutSlowIn, // Courbe d'animation de lecture automatique
        viewportFraction: 1, // Fraction de l'écran occupée par le carrousel
      ),
      items: imageUrls.map((url) {
        return Image.asset(
          url,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }
}
