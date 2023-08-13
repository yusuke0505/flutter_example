import 'package:flutter/material.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_example/user/user_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MyPageScreen extends HookConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.watch(userNotifierProvider.notifier);
    final label = TabItem.myPage.label;
    const imageSize = 80.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) {
                  return;
                }
                await userNotifier.updateProfile(image);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(imageSize / 2),
                child: Image.network(
                  userState.value!.user!.imagePath ?? '',
                  width: imageSize,
                  height: imageSize,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: imageSize,
                      height: imageSize,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
