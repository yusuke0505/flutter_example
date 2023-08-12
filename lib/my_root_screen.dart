import 'package:flutter/material.dart';
import 'package:flutter_example/sign_up/sign_up_screen.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_example/user/user_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoRouterStateExtra {
  const GoRouterStateExtra({
    this.showNavBar = true,
  });

  final bool showNavBar;
}

class MyRootScreen extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    const notShowNabVarPaths = [
      '$homePath/$writePath',
      '$myPagePath/$nameEditPath',
    ];
    final showNavBar = !notShowNabVarPaths.contains(goRouterState.uri.path);
    final scaffold = userState.when(
      data: (data) {
        if (data.user == null) {
          return const SignUpScreen();
        }
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
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: CircularProgressIndicator()),
    );
    return scaffold;
  }
}
