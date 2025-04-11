import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String image;

  SlideInfo(this.title, this.caption, this.image);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'El Lorem Ipsum fue concebido como un texto de relleno, formateado de una cierta manera para permitir la presentación ',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega Rápida',
    'El Lorem Ipsum fue concebido como un texto de relleno, formateado de una cierta manera para permitir la presentación ',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'El Lorem Ipsum fue concebido como un texto de relleno, formateado de una cierta manera para permitir la presentación ',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  // Ruta
  static const String route = 'app_tutorial';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Introducción a la aplicación')),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children:
            slides.map((slideInfo) => _Slide(slideInfo: slideInfo)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slideInfo;

  const _Slide({required this.slideInfo});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
