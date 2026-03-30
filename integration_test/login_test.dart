import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tpc_login/main.dart' as app;
import 'package:flutter/material.dart';
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Successful login', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final emailField = find.byKey(Key('email'));
    final passwordField = find.byKey(Key('password'));
    final loginButton = find.byKey(Key('login'));

    await tester.enterText(emailField, 'test@test.com');
    await tester.enterText(passwordField, '123456');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    final dashboardText = find.byKey(Key('dashboard_text'));
    expect(dashboardText, findsOneWidget);
  });
}