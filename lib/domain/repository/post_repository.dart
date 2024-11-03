import 'package:example_flutter_hans/data/models/post/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
  Future<PostModel> addPost(PostModel post);
}
