import 'package:flutter/material.dart';
import 'package:flutter_example/home/home_notifier.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.watch(homeNotifierProvider.notifier);
    useEffect(() {
      notifier.fetch();
      return null;
    }, const []);
    final body = state.loading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: notifier.refresh,
            child: ListView(
              children: state.postItems
                  .map(
                    (e) => ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        e.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(e.body),
                    ),
                  )
                  .toList(),
            ),
          );
    return Scaffold(
      appBar: AppBar(
        title: Text(TabItem.home.label),
      ),
      body: body,
      floatingActionButton: _Button(
        onTap: () {
          GoRouter.of(context).go('$homePath/$writePath');
        },
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    const size = 40.0;
    const borderRadius = size / 2;
    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: const SizedBox(
            width: size,
            height: size,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
