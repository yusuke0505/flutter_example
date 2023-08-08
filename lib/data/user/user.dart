import 'package:flutter_example/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user.freezed.dart';

@freezed
class UserItem with _$UserItem {
  const factory UserItem({
    required String uid,
    @Default(defaultName) String name,
    String? imagePath,
  }) = _UserItem;
  const UserItem._();

  factory UserItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserItem(
      uid: data?['uid'],
      name: data?['name'],
      imagePath: data?['image_path'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "name": name,
      "image_path": imagePath,
    };
  }
}
