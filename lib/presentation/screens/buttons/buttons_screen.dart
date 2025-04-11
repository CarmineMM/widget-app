import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  // Route name
  static const String route = 'buttons';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 15,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(child: Text('ElevatedButton'), onPressed: () {}),

            const ElevatedButton(
              onPressed: null,
              child: Text('ElevatedButton - Disabled'),
            ),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('ElevatedButton.icon'),
            ),

            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            FilledButton(
              onPressed: null,
              child: const Text('FilledButton - Disabled'),
            ),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility),
              label: const Text('FilledButton.icon'),
            ),

            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
            OutlinedButton(
              onPressed: null,
              child: const Text('OutlinedButton - Disabled'),
            ),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_sharp),
              label: const Text('OutlinedButton.icon'),
            ),

            TextButton(onPressed: () {}, child: const Text('TextButton')),
            TextButton(
              onPressed: null,
              child: const Text('TextButton - Disabled'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.zoom_out_rounded),
              label: const Text('TextButton.icon'),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarms_outlined),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.wrong_location_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.wrong_location_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  colors.tertiaryContainer,
                ),
                iconColor: WidgetStatePropertyAll(colors.onTertiaryContainer),
              ),
            ),

            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.secondary,
        child: InkWell(
          onTap: () {
            print('REACCIONANDO');
          },
          splashColor: colors.primaryFixed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'CustomButton',
              style: TextStyle(color: colors.onSecondary),
            ),
          ),
        ),
      ),
    );
  }
}
