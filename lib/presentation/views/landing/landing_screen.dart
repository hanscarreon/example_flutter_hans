import 'package:example_flutter_hans/core/constant/app_colors.dart';
import 'package:example_flutter_hans/core/constant/app_styles.dart';
import 'package:example_flutter_hans/core/routes/export_route.dart';
import 'package:example_flutter_hans/core/util/widget_extension.dart';
import 'package:example_flutter_hans/presentation/views/carousel/example_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget with AppStyles, AppColor {
  static const String routeName = '/';
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(ExampleCarousel.routeName);
              },
              child: Text(
                'Carousel',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                side: BorderSide(width: 4, color: Colors.red),
              ),
              onPressed: () {
                print("user is logging in");
              }, // add your function here
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(PostCreateScreen.routeName);
              },
              child: Text(
                'Create Post',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.go(PostListScreen.routeName);
              },
              child: Text(
                'Fetch Post',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              height: 1,
              color: AppColor.ash,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                showSnackBar(context, 'work in progress');
              },
              child: Text(
                'Check Album',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
