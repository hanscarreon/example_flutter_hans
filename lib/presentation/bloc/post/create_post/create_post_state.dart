import 'package:equatable/equatable.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

class SuccessCreatePostState extends CreatePostState {
  const SuccessCreatePostState();
}