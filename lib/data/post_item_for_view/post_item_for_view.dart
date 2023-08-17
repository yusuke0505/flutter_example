import 'package:flutter_example/data/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_item_for_view.freezed.dart';

@freezed
class PostItemForView with _$PostItemForView {
  const factory PostItemForView({
    required String body,
    required User userItem,
  }) = _PostItemForView;
}
