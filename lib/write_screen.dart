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
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                maxLines: null,
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
