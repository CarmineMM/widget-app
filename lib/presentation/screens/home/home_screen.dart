import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/drawers/main_navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Flutter + Material 3')),
      body: const _HomeView(),
      drawer: MainNavigationDrawer(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final MenuItem menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: theme.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: theme.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      splashColor: theme.primaryFixed,
      onTap: () {
        context.pushNamed(menuItem.route);
      },
    );
  }
}
