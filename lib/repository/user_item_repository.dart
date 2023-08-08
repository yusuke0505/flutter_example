import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/user/user_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userItemRepositoryProvider = Provider((_) => UserItemRepository());

class UserItemRepository {
  final _instance = FirebaseFirestore.instance;
  static const _collectionPath = 'users';

  Future<UserItem> fetch(String uid) async {
    final snapshot = await _instance.collection(_collectionPath).doc(uid).get();
    return UserItem.fromFirestore(snapshot, null);
  }

  Future<void> create(UserItem item) async {
    await _instance
        .collection(_collectionPath)
        .doc(item.uid)
        .set(item.toFirestore());
  }

  Future<void> update(UserItem item) async {
    await _instance
        .collection(_collectionPath)
        .doc(item.uid)
        .withConverter(
          fromFirestore: UserItem.fromFirestore,
          toFirestore: (user, _) => user.toFirestore(),
        )
        .set(item);
  }
}
