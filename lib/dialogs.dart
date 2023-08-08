import 'package:flutter/material.dart';

Future<void> showCircularProgressIndicatorDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (_) {
      return WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
