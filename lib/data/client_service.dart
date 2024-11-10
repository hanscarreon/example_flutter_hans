import 'package:dio/dio.dart';
import 'package:example_flutter_hans/data/client/post_client.dart';
import 'package:example_flutter_hans/data/data_source/post_repository_impl.dart';
import 'package:example_flutter_hans/domain/repository/post_repository.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_bloc.dart';
import 'package:example_flutter_hans/presentation/bloc/post/fetch_post/fetch_post_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Network clients
  getIt.registerSingleton<Dio>(Dio());

  // API clients
  getIt.registerLazySingleton<PostApiClient>(() => PostApiClient(getIt<Dio>()));

  // Repositories
  getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(getIt<PostApiClient>()));

  // Bloc
  getIt.registerFactory<CreatePostBloc>(
      () => CreatePostBloc(getIt<PostRepository>()));

  getIt.registerFactory<FetchPostBloc>(
      () => FetchPostBloc(getIt<PostRepository>()));
}
