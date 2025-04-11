import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  // Ruta
  static const String route = 'ui_controls';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() => isDeveloper = value);
          },
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(
            'Vehículo seleccionado: ${selectedTransportation.name}',
          ),
          children: [
            RadioListTile(
              title: const Text('Carro'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => selectedTransportation = Transportation.car,
                  ),
            ),
            RadioListTile(
              title: const Text('Bote'),
              subtitle: const Text('Viajar por bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => selectedTransportation = Transportation.boat,
                  ),
            ),
            RadioListTile(
              title: const Text('Avion'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => selectedTransportation = Transportation.plane,
                  ),
            ),
            RadioListTile(
              title: const Text('Submarino'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => selectedTransportation = Transportation.submarine,
                  ),
            ),
          ],
        ),

        CheckboxListTile(
          title: Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged:
              (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }),
        ),

        CheckboxListTile(
          title: Text('¿Almuerzo?'),
          value: wantsLunch,
          onChanged:
              (value) => setState(() {
                wantsLunch = !wantsLunch;
              }),
        ),

        CheckboxListTile(
          title: Text('¿Cena?'),
          value: wantsDinner,
          onChanged:
              (value) => setState(() {
                wantsDinner = !wantsDinner;
              }),
        ),
      ],
    );
  }
}
