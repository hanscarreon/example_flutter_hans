import 'package:equatable/equatable.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_state.dart';

abstract class CommonState extends Equatable implements CreatePostState {
  const CommonState();

  @override
  List<Object> get props => [];
}

/// Common Initial state for all Blocs
class InitialState extends CommonState {
  const InitialState();
}

/// Common Loading state for all Blocs
class LoadingState extends CommonState {
  const LoadingState();
}

/// Common Error state for all Blocs
class ErrorState extends CommonState {
  const ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
