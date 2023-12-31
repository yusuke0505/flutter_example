import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/favorite/favorite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteRepositoryProvider = Provider((_) => FavoriteRepository());

class FavoriteRepository {
  final _instance = FirebaseFirestore.instance;
  static const _collectionPath = 'favorites';

  Future<Favorite?> fetch({
    required String userId,
    required String postItemId,
  }) async {
    try {
      final snapshot = (await _instance
              .collection(_collectionPath)
              .where(Favorite.fromUserIdFieldName, isEqualTo: userId)
              .where(
                Favorite.postItemIdFieldName,
                isEqualTo: postItemId,
              )
              .get())
          .docs
          .first;
      return Favorite.fromFirestore(snapshot, null);
    } on Exception {
      return null;
    }
  }

  Future<List<Favorite>?> fetchList(String userId) async {
    try {
      final snapshot = await _instance
          .collection(_collectionPath)
          .where(Favorite.fromUserIdFieldName, isEqualTo: userId)
          .get();
      return snapshot.docs.map((e) => Favorite.fromFirestore(e, null)).toList();
    } on Exception {
      return null;
    }
  }

  Future<bool> create(Favorite favorite) async {
    try {
      await _instance
          .collection(_collectionPath)
          .doc(favorite.id)
          .set(favorite.toFirestore());
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> delete(Favorite favorite) async {
    try {
      await _instance.collection(_collectionPath).doc(favorite.id).delete();
      return true;
    } on Exception {
      return false;
    }
  }
}
