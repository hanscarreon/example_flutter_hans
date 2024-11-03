import 'package:example_flutter_hans/data/client/post_client.dart';
import 'package:example_flutter_hans/data/models/post/post_model.dart';
import 'package:example_flutter_hans/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostApiClient apiClient;

  PostRepositoryImpl(this.apiClient);

  @override
  Future<PostModel> addPost(PostModel post) => apiClient.addPost(post);

  @override
  Future<List<PostModel>> getPosts() => apiClient.fetchPosts();
}

