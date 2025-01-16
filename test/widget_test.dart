// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:emergency_care/features/auth/views/screens/login_screen.dart';
import 'package:emergency_care/features/splash/views/splash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify that login screen is loaded after splash screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const RootApp());
    await tester.pumpAndSettle();

    // Verify that the Splash screen is initially displayed.
    expect(find.byType(Splash), findsOneWidget);
    expect(find.byType(LoginScreen), findsNothing);

    // Wait for the splash screen to complete its logic (e.g., navigation).
    await tester.pumpAndSettle();

    // Verify that the Splash screen is removed and the Login screen is displayed.
    expect(find.byType(Splash), findsNothing);
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
