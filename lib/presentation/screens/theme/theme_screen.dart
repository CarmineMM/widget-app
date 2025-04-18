import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  static const String route = 'theme';

  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema de la app'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
            onPressed:
                () => ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        final Color activeColor = color == Colors.white ? Colors.black : color;

        return RadioListTile(
          value: index,
          groupValue: selectedColor,
          title: Text(
            'Este tema de color:',
            style: TextStyle(color: activeColor),
          ),
          subtitle: Text('${color.toARGB32()}'),
          activeColor: activeColor,
          onChanged: (int? value) {
            // Notificar el cambio al provider
            ref.read(themeNotifierProvider.notifier).selectedColor(value!);
          },
        );
      },
    );
  }
}
