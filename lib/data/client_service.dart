import 'package:dio/dio.dart';
import 'package:example_flutter_hans/data/client/post_client.dart';
import 'package:example_flutter_hans/data/data_source/post_repository_impl.dart';
import 'package:example_flutter_hans/domain/repository/post_repository.dart';
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

  // Add other dependencies similarly
}