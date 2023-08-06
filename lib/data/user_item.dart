import 'package:flutter_example/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_item.freezed.dart';

@freezed
class UserItem with _$UserItem {
  const factory UserItem({
    @Default(defaultName) String name,
    String? imagePath,
  }) = _UserItem;
}
