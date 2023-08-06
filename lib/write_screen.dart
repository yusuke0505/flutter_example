import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WriteScreen extends HookWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                maxLines: null,
                autofocus: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
