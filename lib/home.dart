import 'package:flutter/material.dart';
import 'package:flutter_example/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeLabel),
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
      floatingActionButton: Material(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
