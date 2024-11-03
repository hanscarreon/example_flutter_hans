import 'dart:async';

import 'package:example_flutter_hans/core/bloc/common_state.dart';
import 'package:example_flutter_hans/domain/repository/post_repository.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_create_event.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final PostRepository repository;

  CreatePostBloc(
    this.repository,
  ) : super(const InitialState()) {
    on<OnCreatePostevent>(onCreatePost);
  }

  FutureOr<void> onCreatePost(
    OnCreatePostevent event,
    Emitter<CreatePostState> emit,
  ) async {
    emit(const LoadingState());

    try {
      repository.addPost(event.post);
      emit(const SuccessCreatePostState());
    } catch (e) {
      emit(const ErrorState('Failed to fetch posts'));
    }
  }
}
