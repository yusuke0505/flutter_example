import 'package:flutter_example/data/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'post_item.freezed.dart';

@freezed
class PostItem with _$PostItem {
  const factory PostItem({
    required String body,
    required User userItem,
  }) = _PostItem;
  const PostItem._();

  factory PostItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return PostItem(
      body: data?['body'],
      userItem: data?['user_item'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "body": body,
      "user_item": userItem.toFirestore(),
    };
  }
}
