enum TabItem {
  home(label: 'ホーム'),
  favorite(label: 'お気に入り'),
  myPage(label: 'マイページ');

  const TabItem({
    required this.label,
  });

  final String label;
}
