import 'package:flutter/material.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:go_router/go_router.dart';

class GoRouterStateExtra {
  const GoRouterStateExtra({
    this.showNavBar = true,
  });

  final bool showNavBar;
}

class MyRootScreen extends StatelessWidget {
  const MyRootScreen({
    this.extra = const GoRouterStateExtra(),
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final GoRouterStateExtra extra;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: extra.showNavBar
          ? BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                for (var i = 0; i < TabItem.values.length; i++)
                  BottomNavigationBarItem(
                    icon: TabItem.values[i].icon,
                    label: TabItem.values[i].label,
                  ),
              ],
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            )
          : null,
    );
  }
}
