import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_bloc.dart';
import 'package:example_flutter_hans/presentation/views/landing/landing_screen.dart';
import 'package:example_flutter_hans/presentation/views/post/create_post/create_post_screen.dart';
import 'package:example_flutter_hans/presentation/views/post/post_list/post_list_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: LandingScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingScreen();
      },
    ),
    GoRoute(
      path: PostListScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const PostListScreen();
      },
    ),
    GoRoute(
      path: PostCreateScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => GetIt.I<CreatePostBloc>(),
          child: const PostCreateScreen(),
        );
      },
    ),
  ],
);
