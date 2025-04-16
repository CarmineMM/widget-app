import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  final int count = 0;

  const CounterScreen({super.key});

  static const String route = 'counter';

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      body: Center(child: Text('Valor: $count', style: textStyle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
