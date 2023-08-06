import 'package:flutter/material.dart';
import 'package:flutter_example/name_edit/name_edit_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NameEditScreen extends HookConsumerWidget {
  const NameEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nameEditNotifierProvider);
    final notifier = ref.watch(nameEditNotifierProvider.notifier);
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('名前編集'),
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
