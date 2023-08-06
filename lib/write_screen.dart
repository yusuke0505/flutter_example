import 'package:flutter/material.dart';
import 'package:flutter_example/home_notifier.dart';
import 'package:flutter_example/write_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteScreen extends HookConsumerWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(writeNotifierProvider);
    final notifier = ref.watch(writeNotifierProvider.notifier);
    final homeNotifier = ref.watch(homeNotifierProvider.notifier);
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
                  onChanged: (val) {
                    notifier.onTextChanged(val);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _Button(
                  enable: state.text.isNotEmpty,
                  onTap: () {
                    homeNotifier.post(state.text);
                    GoRouter.of(context).pop();
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

class _Button extends StatelessWidget {
  const _Button({
    required this.onTap,
    required this.enable,
  });

  final VoidCallback onTap;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    const radius = 4.0;
    return Material(
      color: Colors.blue.withOpacity(enable ? 1 : 0.5),
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: enable ? onTap : null,
        borderRadius: BorderRadius.circular(radius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              '投稿',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
