import 'package:example_flutter_hans/core/bloc/common_state.dart';
import 'package:example_flutter_hans/core/bloc/export_bloc.dart';
import 'package:example_flutter_hans/presentation/bloc/post/fetch_post/fetch_post_event.dart';
import 'package:example_flutter_hans/presentation/bloc/post/fetch_post/fetch_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListScreen extends StatelessWidget {
  static const String routeName = '/post/list';
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchBloc = BlocProvider.of<FetchPostBloc>(context);
    fetchBloc.add(const OnFetchPostevent());
    return Scaffold(
      body: BlocBuilder(
        bloc: fetchBloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OnFetchPostState) {
            final posts = state.posts;
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xff764abc),
                    child: Text('$index'),
                  ),
                  title: Text('Item ${post.title}'),
                  subtitle: Text(post.body),
                  trailing: const Icon(Icons.more_vert),
                );
              },
            );
          } // OnFetchPostState

          if (state is EmptyState) {
            return const Center(
              child: Text('No Post'),
            );
          }

          if (state is ErrorState) {
            return Center(
              child: IconButton(
                onPressed: () {
                  fetchBloc.add(const OnFetchPostevent());
                },
                icon: const Icon(Icons.refresh_outlined),
              ),
            );
          }
          return const Center(
            child: Text('Add Catcher Default screen'),
          );
        },
      ),
    );
  }
}
