import 'package:flutter/material.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:go_router/go_router.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final label = TabItem.myPage.label;
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('$myPagePath/$detailsPath');
              },
              child: const Text('View details'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}
