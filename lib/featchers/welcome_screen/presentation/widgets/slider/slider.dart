import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderCrusur {
  final List<String> imageUrls = [
    'images/slider/2.jpg',
    'images/slider/3.jpg',
    'images/slider/4.jpg',
    // Ajoutez d'autres URL d'images ici
  ];
  slider() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400, maxWidth: 1500),
      child: CarouselSlider(
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
            fit: BoxFit
                .cover, // Ajustez le mode d'ajustement de l'image selon vos besoins
          );
        }).toList(),
      ),
    );
  }
}
