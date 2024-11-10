import 'package:bloc_test/bloc_test.dart';
import 'package:example_flutter_hans/core/bloc/common_state.dart';
import 'package:example_flutter_hans/data/data_source/post_repository_impl.dart';
import 'package:example_flutter_hans/data/models/post/post_model.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_event.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_bloc.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([PostRepositoryImpl])
import 'post_create_bloc_test.mocks.dart';

void main() {
  late MockPostRepositoryImpl mockRepository;
  late CreatePostBloc createPostBloc;

  setUp(() {
    mockRepository = MockPostRepositoryImpl();
    createPostBloc = CreatePostBloc(mockRepository);
  });

  tearDown(() {
    createPostBloc.close();
  });

  group('CreatePostBloc Tests', () {
    final post = PostModel.mock();

    blocTest<CreatePostBloc, CreatePostState>(
      'emits [LoadingState, SuccessCreatePostState] when post creation is successful',
      build: () {
        when(mockRepository.addPost(post)).thenAnswer((_) async => post);
        return createPostBloc;
      },
      act: (bloc) => bloc.add(OnCreatePostevent(post: post)),
      expect: () => [
        const LoadingState(),
        const SuccessCreatePostState(),
      ],
      verify: (_) {
        verify(mockRepository.addPost(post)).called(1);
      },
    );

    blocTest<CreatePostBloc, CreatePostState>(
      'emits [LoadingState, ErrorState] when post creation fails',
      build: () {
        when(mockRepository.addPost(post))
            .thenThrow(Exception('Failed to create post'));
        return createPostBloc;
      },
      act: (bloc) => bloc.add(OnCreatePostevent(post: post)),
      expect: () => [
        const LoadingState(),
        const ErrorState('Failed to create posts'),
      ],
      verify: (_) {
        verify(mockRepository.addPost(post)).called(1);
      },
    );
  });
}
