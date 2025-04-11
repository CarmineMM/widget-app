import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  // Ruta
  static const String route = 'app_tutorial';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introducción a la aplicación')),
    );
  }
}
