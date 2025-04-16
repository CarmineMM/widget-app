import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class MainNavigationDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainNavigationDrawer({super.key, required this.scaffoldKey});

  @override
  State<MainNavigationDrawer> createState() => _MainNavigationDrawerState();
}

class _MainNavigationDrawerState extends State<MainNavigationDrawer> {
  int navDrawerIndex = 100;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.pushNamed(menuItem.route);

        // Acceder al widget padre, desde el state widget
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, viewPadding.top, 0, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text('More Options'),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
