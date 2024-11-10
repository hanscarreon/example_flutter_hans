import 'package:example_flutter_hans/core/bloc/export_bloc.dart';
import 'package:example_flutter_hans/core/routes/export_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: LandingScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return LandingScreen();
      },
    ),
    GoRoute(
      path: PostListScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => GetIt.I<FetchPostBloc>(),
          child: const PostListScreen(),
        );
      },
    ),
    GoRoute(
      path: PostCreateScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => GetIt.I<CreatePostBloc>(),
          child: PostCreateScreen(),
        );
      },
    ),
    GoRoute(
      path: AlbumScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const AlbumScreen();
      },
    ),
  ],
);
