import 'package:example_flutter_hans/data/client_service.dart';
import 'package:example_flutter_hans/main.dart';
import 'package:example_flutter_hans/presentation/views/post/create_post/create_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Post Create Screen Test', () {
    testWidgets('Form submission test', (WidgetTester tester) async {
      // Initialize your dependencies or services as you would in main.dart
      setupDependencies();

      // Start the app
      await tester.pumpWidget(const MyApp());
      // Navigate to the PostCreateScreen
      await tester.tap(find.text('Create Post'));
      await tester.pumpAndSettle();

      // Ensure we are on the PostCreateScreen
      expect(find.byType(PostCreateScreen), findsOneWidget);

      // Locate the input fields and submit button
      final titleField = find.byKey(const Key('titleTextField'));

      final bodyField = find.byKey(const Key('bodyTextField'));
      final submtButton = find.byKey(const Key('submtButton'));

      // Enter text into the title field
      await tester.enterText(titleField, 'Sample Title');
      await tester.pumpAndSettle();

      // Enter text into the body field
      await tester.enterText(bodyField, 'Sample Body Content');
      await tester.pumpAndSettle();

      // Tap on submit button
      await tester.tap(submtButton);
      await tester.pumpAndSettle();

      // Check for success feedback (snackbar, for example)
      expect(find.text('Post Added'), findsOneWidget);

      // Ensure fields are cleared after submission
      expect(find.text('Sample Title'), findsNothing);
      expect(find.text('Sample Body Content'), findsNothing);
    });
  });
}
