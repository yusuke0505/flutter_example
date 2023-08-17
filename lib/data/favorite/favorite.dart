import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'favorite.freezed.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required String fromUserId,
    required String postItemId,
  }) = _Favorite;
  const Favorite._();

  factory Favorite.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Favorite(
      fromUserId: data?['from_user_id'],
      postItemId: data?['post_item_id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "from_user_id": fromUserId,
      "post_item_id": postItemId,
    };
  }
}
