import 'package:flutter/material.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_example/user/user_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageScreen extends HookConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.watch(userNotifierProvider.notifier);
    final label = TabItem.myPage.label;
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userState.value!.user!.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('$myPagePath/$nameEditPath');
                  },
                  child: const Text('編集'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {
                userNotifier.signOut().then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(value ? 'ログアウトに成功しました' : 'ログアウトに失敗しました'),
                    ),
                  );
                });
              },
              child: const Text('ログアウト'),
            ),
          ),
        ],
      ),
    );
  }
}
