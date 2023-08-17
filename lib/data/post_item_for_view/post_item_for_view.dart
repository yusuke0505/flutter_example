import 'package:flutter_example/data/user/user.dart';

class PostItemForView {
  const PostItemForView({
    required this.body,
    required this.userItem,
  });

  final String body;
  final User userItem;
}
