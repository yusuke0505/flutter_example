import 'package:flutter/material.dart';
import 'package:flutter_example/constants.dart';
import 'package:flutter_example/post_button.dart';
import 'package:flutter_example/user/user_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();
    final userNotifier = ref.watch(userNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録/ログイン'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: emailTextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'メールアドレス',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '入力してください';
                    }
                    if (!RegExp(validEMailAddressRegExp).hasMatch(value!)) {
                      return '無効なメールアドレスです';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: passwordTextEditingController,
                  maxLength: 16,
                  decoration: const InputDecoration(
                    labelText: 'パスワード',
                    hintText: '8文字以上',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '入力してください';
                    }
                    if (value!.length < 8) {
                      return '8文字以上入力してください';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PostButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        userNotifier
                            .createUser(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text,
                        )
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text(value ? '新規登録に成功しました' : '新規登録に失敗しました'),
                            ),
                          );
                        });
                      }
                    },
                    enable: true,
                    label: '新規登録',
                  ),
                  const SizedBox(width: 40),
                  PostButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ログインに成功しました')),
                        );
                      }
                    },
                    enable: true,
                    label: 'ログイン',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
