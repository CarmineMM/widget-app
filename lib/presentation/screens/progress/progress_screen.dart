import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  // Ruta
  static const String route = 'progress';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Circular Progress Indicator'),
          const SizedBox(height: 20),
          CircularProgressIndicator(
            strokeWidth: 6,
            backgroundColor: colors.inversePrimary,
          ),

          const SizedBox(height: 80),
          const Text('Circular - Linear Controlado'),
          const SizedBox(height: 20),
          _ControlledCircularProgressIndicator(colors: colors),
        ],
      ),
    );
  }
}

class _ControlledCircularProgressIndicator extends StatelessWidget {
  const _ControlledCircularProgressIndicator({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (value) => (value * 2) / 100,
      ).takeWhile((value) => value < 100),

      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 6,
                color: colors.tertiary,
                backgroundColor: colors.inversePrimary,
                value: progressValue,
              ),
              const SizedBox(width: 20),

              Expanded(child: LinearProgressIndicator(value: progressValue)),
            ],
          ),
        );
      },
    );
  }
}
