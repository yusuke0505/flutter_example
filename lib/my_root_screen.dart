import 'package:flutter/material.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:go_router/go_router.dart';

class MyRootScreen extends StatelessWidget {
  const MyRootScreen({
    required this.state,
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final GoRouterState state;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final showNavBar = state.extra != 'not_show_navbar';
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: showNavBar
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
