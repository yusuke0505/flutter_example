import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/user/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postItemRepositoryProvider = Provider((_) => PostItemRepository());

class PostItemRepository {
  final _instance = FirebaseFirestore.instance;
  static const _collectionPath = 'post_items';

  Future<User?> fetch(String uid) async {
    try {
      final snapshot =
          await _instance.collection(_collectionPath).doc(uid).get();
      return User.fromFirestore(snapshot, null);
    } on Exception {
      return null;
    }
  }

  Future<bool> create(User item) async {
    try {
      await _instance
          .collection(_collectionPath)
          .doc(item.uid)
          .set(item.toFirestore());
      return true;
    } on Exception {
      return false;
    }
  }
}
