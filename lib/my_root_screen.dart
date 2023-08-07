import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/post_button.dart';
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
    required this.goRouterState,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final GoRouterStateExtra extra;
  final StatefulNavigationShell navigationShell;
  final GoRouterState goRouterState;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    const notShowNabVarPaths = [
      '$homePath/$writePath',
      '$myPagePath/$nameEditPath',
    ];
    final showNavBar = !notShowNabVarPaths.contains(goRouterState.uri.path);
    return isLoggedIn
        ? Scaffold(
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
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('新規登録/ログイン'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PostButton(
                        onTap: () {},
                        enable: true,
                        label: '新規登録',
                      ),
                      const SizedBox(width: 40),
                      PostButton(
                        onTap: () {},
                        enable: true,
                        label: 'ログイン',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
