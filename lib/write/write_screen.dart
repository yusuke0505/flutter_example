import 'package:flutter/material.dart';
import 'package:flutter_example/dialogs.dart';
import 'package:flutter_example/post_button.dart';
import 'package:flutter_example/write/write_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteScreen extends HookConsumerWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(writeNotifierProvider);
    final notifier = ref.watch(writeNotifierProvider.notifier);
    final textEditingController = useTextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('投稿'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 240,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  controller: textEditingController,
                  maxLines: null,
                  autofocus: true,
                  maxLength: 140,
                  onChanged: (val) {
                    notifier.onTextChanged(val);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PostButton(
                  label: '投稿',
                  enable: state.text.isNotEmpty,
                  onTap: () {
                    showCircularProgressIndicatorDialog(context);
                    notifier.post().then((value) {
                      GoRouter.of(context).pop();
                      if (!value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('投稿に失敗しました')),
                        );
                        return;
                      }
                      GoRouter.of(context).pop();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
