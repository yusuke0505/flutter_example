import 'package:flutter/material.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TabItem.home.label),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 3; i++)
            const ListTile(
              title: Text(
                '名前',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('本文'),
            ),
        ],
      ),
      floatingActionButton: _Button(
        onTap: () {
          GoRouter.of(context).go('/home/write');
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
