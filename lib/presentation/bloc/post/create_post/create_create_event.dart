import 'package:equatable/equatable.dart';
import 'package:example_flutter_hans/data/models/post/post_model.dart';




abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class OnCreatePostevent extends CreatePostEvent {
  final PostModel post;
  const OnCreatePostevent({required this.post});

  @override
  List<Object> get props => [post];
}
