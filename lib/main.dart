import 'package:flutter/material.dart';
import 'package:flutter_example/home/home_screen.dart';
import 'package:flutter_example/my_page_screen.dart';
import 'package:flutter_example/name_edit/name_edit_screen.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_example/write/write_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'my_root_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

void main() {
  runApp(
    ProviderScope(
      child: NestedTabNavigationExampleApp(),
    ),
  );
}

class NestedTabNavigationExampleApp extends StatelessWidget {
  NestedTabNavigationExampleApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: homePath,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (_, state, navigationShell) {
          if (state.extra == null) {
            return MyRootScreen(
              navigationShell: navigationShell,
              goRouterState: state,
            );
          } else {
            return MyRootScreen(
              extra: state.extra as GoRouterStateExtra,
              navigationShell: navigationShell,
              goRouterState: state,
            );
          }
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: homePath,
                builder: (_, __) => const HomeScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: writePath,
                    builder: (_, __) => const WriteScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: favoritePath,
                builder: (_, __) => RootScreen(
                  label: TabItem.favorite.label,
                  detailsPath: '$favoritePath/$detailsPath',
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: detailsPath,
                    builder: (_, __) => const DetailsScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: myPagePath,
                builder: (_, __) => const MyPageScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: nameEditPath,
                    builder: (_, __) => const NameEditScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({
    required this.label,
    required this.detailsPath,
    super.key,
  });

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath);
              },
              child: const Text('View details'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends HookWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Counter: ${counter.value}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                counter.value = counter.value + 1;
              },
              child: const Text('Increment counter'),
            ),
            const Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
    );
  }
}
