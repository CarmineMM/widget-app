import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class AppTutorialScreen extends StatefulWidget {
  // Ruta
  static const String route = 'app_tutorial';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text('Introducción a la aplicación')),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children:
                slides
                    .map((slideInfo) => _Slide(slideInfo: slideInfo))
                    .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: Text('Salir'),
              onPressed: () {
                context.pop();
              },
            ),
          ),

          if (endReach)
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 8,
                delay: const Duration(milliseconds: 600),
                child: FilledButton(
                  child: const Text('Comenzar'),
                  onPressed: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slideInfo;

  const _Slide({required this.slideInfo});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleLarge;
    final captionStyle = textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slideInfo.image)),
            const SizedBox(height: 20),
            Text(slideInfo.title, style: titleStyle),
            const SizedBox(height: 10),
            Text(slideInfo.caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
