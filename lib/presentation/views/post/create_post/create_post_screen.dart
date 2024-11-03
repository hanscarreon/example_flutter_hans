import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_bloc.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCreateScreen extends StatelessWidget {
  static const String routeName = 'post/create';
  const PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<CreatePostBloc>(context);
    return Scaffold(
      body: BlocConsumer<CreatePostBloc, CreatePostState>(
          listener: (context, CreatePostState state) {},
          bloc: postBloc,
          builder: (context, state) {
            return Column(
              children: [
                TextField(),
                TextField(),
                ElevatedButton(onPressed: () {}, child: Text('submit'))
              ],
            );
          }),
    );
  }
}
