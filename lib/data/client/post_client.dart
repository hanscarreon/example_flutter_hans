import 'package:dio/dio.dart';
import 'package:example_flutter_hans/data/models/post/post_model.dart';

class PostApiClient {
  final Dio dio;

  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  PostApiClient(this.dio);

  Future<List<PostModel>> fetchPosts() async {
    final response = await dio.get('$baseUrl/posts');
    return (response.data as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }

  Future<PostModel> addPost(PostModel post) async {
    final response = await dio.post(
      '$baseUrl/posts',
      data: post.toJson(),
    );

    print(post.title);
    print(post.body);
    print(response.data);
    return PostModel.fromJson(response.data);
  }
}
