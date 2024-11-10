import 'package:example_flutter_hans/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.title,
    required super.body,
    required super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'userId': userId,
      };

  factory PostModel.mock({
    String? title,
    String? body,
    int? userId,
  }) {
    return PostModel(
      title: title ?? 'title',
      body: body ?? 'body',
      userId: userId ?? 1,
    );
  }
}
