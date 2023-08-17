import 'package:flutter/material.dart';
import 'package:flutter_example/favorite/favorite_screen.dart';
import 'package:flutter_example/home/home_screen.dart';
import 'package:flutter_example/my_page_screen.dart';
import 'package:flutter_example/name_edit/name_edit_screen.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_example/write/write_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'my_root_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionNav');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            navigatorKey: _sectionNavigatorKey,
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
                builder: (_, __) =>
                    FavoriteScreen(label: TabItem.favorite.label),
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
