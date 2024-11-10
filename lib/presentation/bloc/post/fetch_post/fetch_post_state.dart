

import 'package:equatable/equatable.dart';
import 'package:example_flutter_hans/data/models/post/post_model.dart';

abstract class FetchPostState extends Equatable {
  const FetchPostState();

  @override
  List<Object> get props => [];
}

class OnFetchPostState extends FetchPostState {
  final List<PostModel> posts;
  const OnFetchPostState({required this.posts});

  @override
  List<Object> get props => [posts];
}
