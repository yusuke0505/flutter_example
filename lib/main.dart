import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

void main() {
  runApp(NestedTabNavigationExampleApp());
}

class NestedTabNavigationExampleApp extends StatelessWidget {
  NestedTabNavigationExampleApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/a',
                builder: (_, __) => const HomeScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (_, __) => const DetailsScreen(label: 'A'),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/b',
                builder: (_, __) =>
                    const RootScreen(label: 'お気に入り', detailsPath: '/b/details'),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (_, __) => const DetailsScreen(label: 'B'),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/c',
                builder: (_, __) =>
                    const RootScreen(label: 'マイページ', detailsPath: '/c/details'),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (_, __) => const DetailsScreen(label: 'C'),
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

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'マイページ',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: ListView(
        children: const [],
      ),
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
                GoRouter.of(context).go(detailsPath, extra: '$label-XYZ');
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
  const DetailsScreen({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Details for $label - Counter: ${counter.value}',
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
