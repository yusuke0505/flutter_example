import 'package:flutter/material.dart';
import 'package:flutter_example/post_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録/ログイン'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                maxLength: 16,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                  hintText: '8文字以上',
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PostButton(
                  onTap: () {},
                  enable: true,
                  label: '新規登録',
                ),
                const SizedBox(width: 40),
                PostButton(
                  onTap: () {},
                  enable: true,
                  label: 'ログイン',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
