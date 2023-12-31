import 'package:flutter/material.dart';
import 'package:flutter_example/data/post_item_for_view/post_item_for_view.dart';
import 'package:flutter_example/dialogs.dart';
import 'package:flutter_example/home/home_notifier.dart';
import 'package:flutter_example/tab_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.watch(homeNotifierProvider.notifier);
    final body = state.when(
      data: (data) {
        return RefreshIndicator(
          onRefresh: notifier.refresh,
          child: ListView(
            children: data.postItems
                .map(
                  (e) => _Tile(
                    item: e,
                    toggleFavorite: () => notifier.toggleFavorite(e),
                  ),
                )
                .toList(),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: CircularProgressIndicator()),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(TabItem.home.label),
      ),
      body: body,
      floatingActionButton: _AddButton(
        onTap: () {
          GoRouter.of(context).go('$homePath/$writePath');
        },
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.item,
    required this.toggleFavorite,
  });

  final PostItemForView item;
  final Future<bool> Function() toggleFavorite;

  @override
  Widget build(BuildContext context) {
    const leadingSize = 40.0;
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(leadingSize / 2),
        child: Image.network(
          item.userItem.imagePath ?? '',
          width: leadingSize,
          height: leadingSize,
          errorBuilder: (_, __, ___) {
            return Container(
              width: leadingSize,
              height: leadingSize,
              color: Colors.grey,
            );
          },
        ),
      ),
      title: Text(
        item.userItem.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(item.body),
      trailing: _FavoriteButton(
        isFavorited: item.isFavorited,
        onTap: toggleFavorite,
      ),
    );
  }
}

class _FavoriteButton extends HookWidget {
  const _FavoriteButton({
    required this.isFavorited,
    required this.onTap,
  });

  final bool isFavorited;
  final Future<bool> Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isFavoritedNotifier = useState<bool>(isFavorited);
    useEffect(() {
      isFavoritedNotifier.value = isFavorited;
      return null;
    }, [isFavorited]);
    return InkWell(
      onTap: () {
        showCircularProgressIndicatorDialog(context);
        onTap().then((value) {
          GoRouter.of(context).pop();
          isFavoritedNotifier.value = !isFavoritedNotifier.value;
          if (!value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('処理に失敗しました')),
            );
            return;
          }
          if (isFavoritedNotifier.value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('お気に入りしました')),
            );
          }
        });
      },
      child: Icon(
        Icons.favorite,
        color: isFavoritedNotifier.value ? Colors.pink : Colors.grey,
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
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
