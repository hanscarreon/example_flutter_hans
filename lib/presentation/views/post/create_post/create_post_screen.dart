import 'package:example_flutter_hans/core/constant/app_styles.dart';
import 'package:example_flutter_hans/core/util/widget_extension.dart';
import 'package:example_flutter_hans/core/widget/inputs/app_input_widget.dart';
import 'package:example_flutter_hans/data/models/post/post_model.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_event.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_bloc.dart';
import 'package:example_flutter_hans/presentation/bloc/post/create_post/create_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCreateScreen extends StatelessWidget with AppStyles {
  static const String routeName = '/post/create';
  PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<CreatePostBloc>(context);
    final TextEditingController titleCtrl = TextEditingController();
    final TextEditingController bodyCtrl = TextEditingController();
    return Scaffold(
      body: ListView(
        padding: screenPadding,
        children: [
          BlocConsumer<CreatePostBloc, CreatePostState>(
              listener: (context, CreatePostState state) {
                if (state is SuccessCreatePostState) {
                  showSnackBar(context, 'Post Added');
                  titleCtrl.clear();
                  bodyCtrl.clear();
                }
              },
              bloc: postBloc,
              builder: (context, state) {
                return Column(
                  children: [
                    AppInputWidget(
                      label: "title",
                      textEditingController: titleCtrl,
                    ),
                    AppInputWidget(
                      label: "body",
                      textEditingController: bodyCtrl,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        postBloc.add(
                          OnCreatePostevent(
                            post: PostModel(
                              title: titleCtrl.text,
                              body: bodyCtrl.text,
                              userId: 1,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'submit',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
