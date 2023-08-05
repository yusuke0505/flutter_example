import 'package:flutter/material.dart';
import 'package:flutter_example/main.dart';

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
      floatingActionButton: const _Button(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();
  @override
  Widget build(BuildContext context) {
    const size = 40.0;
    const borderRadius = size / 2;
    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () {},
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
