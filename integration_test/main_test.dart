import 'package:example_flutter_hans/data/client_service.dart';
import 'package:example_flutter_hans/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MyApp launches and navigates to PostCreateScreen',
      (WidgetTester tester) async {
    // Initialize your dependencies or services as you would in main.dart
    setupDependencies();
    app.MyApp;
    await tester.pumpAndSettle();

    // Start the app
    // await tester.pumpWidget(const MyApp());
  });
}
