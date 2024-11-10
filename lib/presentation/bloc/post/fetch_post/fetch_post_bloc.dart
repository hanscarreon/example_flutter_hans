import 'dart:async';

import 'package:example_flutter_hans/core/bloc/common_state.dart';
import 'package:example_flutter_hans/domain/repository/post_repository.dart';
import 'package:example_flutter_hans/presentation/bloc/post/fetch_post/fetch_post_event.dart';
import 'package:example_flutter_hans/presentation/bloc/post/fetch_post/fetch_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchPostBloc extends Bloc<FetchPostEvent, FetchPostState> {
  final PostRepository repository;
  FetchPostBloc(this.repository) : super(const InitialState()) {
    on<OnFetchPostevent>(onCreatePost);
  }

  FutureOr<void> onCreatePost(
    OnFetchPostevent event,
    Emitter<FetchPostState> emit,
  ) async {
    emit(const LoadingState());
    try {
      final response = await repository.getPosts();
      if (response.isEmpty) {
        return emit(const EmptyState());
      }
      return emit(OnFetchPostState(posts: response));
    } catch (e) {
      return emit(const ErrorState('Failed to fetch posts'));
    }
  }
}
