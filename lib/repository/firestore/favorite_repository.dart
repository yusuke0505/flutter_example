import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/favorite/favorite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteRepositoryProvider = Provider((_) => FavoriteRepository());

class FavoriteRepository {
  final _instance = FirebaseFirestore.instance;
  static const _collectionPath = 'favorites';

  // TODO(you): 自分のお気に入りだけを取得する
  Future<List<Favorite>?> fetchList() async {
    try {
      final snapshot = await _instance.collection(_collectionPath).get();
      return snapshot.docs.map((e) => Favorite.fromFirestore(e, null)).toList();
    } on Exception {
      return null;
    }
  }

  Future<bool> create(Favorite favorite) async {
    try {
      await _instance
          .collection(_collectionPath)
          .doc()
          .set(favorite.toFirestore());
      return true;
    } on Exception {
      return false;
    }
  }
}
