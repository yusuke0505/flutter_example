import 'package:flutter/material.dart';

enum TabItem {
  home(
    label: 'ホーム',
    icon: Icon(Icons.home),
  ),
  favorite(
    label: 'お気に入り',
    icon: Icon(Icons.favorite),
  ),
  myPage(
    label: 'マイページ',
    icon: Icon(Icons.person),
  );

  const TabItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final Icon icon;
}
