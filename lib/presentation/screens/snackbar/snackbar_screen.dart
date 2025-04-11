import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  // Ruta
  static const String route = 'snackbar';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Este es un snackbar'),
        action: SnackBarAction(label: 'Ok', onPressed: () {}),
        duration: const Duration(seconds: 2),
        backgroundColor: colors.tertiary,
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: const Text('¿Estas seguro?'),
            content: const Text('¿Deseas borrar todos los licencias usadas?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y Dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              child: const Text('Licencias usadas'),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: const [
                    Text('Licencias usadas'),
                    Text('A continuación el listado de licencias usadas'),
                  ],
                );
              },
            ),

            FilledButton.tonal(
              child: const Text('Mostrar dialogo'),
              onPressed: () => openDialog(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.ac_unit),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
