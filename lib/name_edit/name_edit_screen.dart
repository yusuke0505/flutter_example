import 'package:flutter/material.dart';
import 'package:flutter_example/name_edit/name_edit_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NameEditScreen extends HookConsumerWidget {
  const NameEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nameEditNotifierProvider);
    final notifier = ref.watch(nameEditNotifierProvider.notifier);
    final textEditingController = useTextEditingController();
    useEffect(() {
      notifier.fetch();
      return null;
    }, const []);
    useEffect(() {
      if (!state.loading) {
        textEditingController.text = state.name;
      }
      return null;
    }, [state.loading]);
    final body = state.loading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: textEditingController,
              autofocus: true,
              maxLength: 10,
            ),
          );
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('名前編集'),
        ),
        body: body,
      ),
    );
  }
}
