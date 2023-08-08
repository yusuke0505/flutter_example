import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/user_item/user_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userItemRepositoryProvider = Provider((_) => UserItemRepository());

class UserItemRepository {
  final _instance = FirebaseFirestore.instance;

  Future<UserItem> fetch(String uid) async {
    final snapshot = await _instance.collection('users').doc(uid).get();
    return UserItem.fromFirestore(snapshot, null);
  }
}
