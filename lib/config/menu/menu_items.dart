import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/animated/animated_screen.dart';
import 'package:widgets_app/presentation/screens/app_tutorial/app_tutorial_screen.dart';
import 'package:widgets_app/presentation/screens/counter/counter_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.route,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Riverpod Counter',
    subTitle: 'Introducción a RIverpod',
    route: CounterScreen.route,
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    route: 'buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    route: 'cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y Controlados',
    route: ProgressScreen.route,
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbar y Dialogs',
    subTitle: 'Indicadores en pantalla',
    route: SnackbarScreen.route,
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful Widget animated',
    route: AnimatedScreen.route,
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    route: UIControlsScreen.route,
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeña introducción a la aplicación',
    route: AppTutorialScreen.route,
    icon: Icons.accessible_rounded,
  ),
  MenuItem(
    title: 'Infinity Scroll y Pull',
    subTitle: 'Listas infinitas y pull to refresh',
    route: InfiniteScrollScreen.route,
    icon: Icons.list_alt_rounded,
  ),
];
