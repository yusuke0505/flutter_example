import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/post_item/post_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postItemRepositoryProvider = Provider((_) => PostItemRepository());

class PostItemRepository {
  final _instance = FirebaseFirestore.instance;
  static const _collectionPath = 'post_items';

  Future<List<PostItem>?> fetchList() async {
    try {
      final snapshot = await _instance.collection(_collectionPath).get();
      return snapshot.docs.map((e) => PostItem.fromFirestore(e, null)).toList();
    } on Exception {
      return null;
    }
  }

  Future<bool> create(PostItem item) async {
    try {
      await _instance
          .collection(_collectionPath)
          .doc(item.id)
          .set(item.toFirestore());
      return true;
    } on Exception {
      return false;
    }
  }
}
