import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'favorite.freezed.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required String postItemId,
    required String fromUserId,
    required String id,
  }) = _Favorite;
  const Favorite._();

  static const postItemIdFieldName = 'post_item_id';
  static const fromUserIdFieldName = 'from_user_id';

  factory Favorite.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Favorite(
      postItemId: data?[postItemIdFieldName],
      fromUserId: data?[fromUserIdFieldName],
      id: data?['id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      postItemIdFieldName: postItemId,
      fromUserIdFieldName: fromUserId,
      "id": id,
    };
  }
}
