import 'package:example_flutter_hans/presentation/views/post/create_post/create_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = '/';
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go(PostCreateScreen.routeName);
            },
            child: const Text('Create Post'),
          )
        ],
      ),
    );
  }
}
