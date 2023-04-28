import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_tdd/login_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "test login with invalid email and password",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      Finder emailTextField = find.byKey(const ValueKey('email'));
      await tester.enterText(emailTextField, 'mazen@google');

      Finder passwordTextField = find.byKey(const ValueKey('password'));
      await tester.enterText(passwordTextField, '1234');

      //act
      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      //assert
      expect(find.text('Invalid email address'), findsOneWidget);
      expect(find.text('Invalid password'), findsOneWidget);
    },
  );
  testWidgets(
    "test login with valid email and password",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      Finder emailTextField = find.byKey(const ValueKey('email'));
      await tester.enterText(emailTextField, 'mazen@google.com');

      Finder passwordTextField = find.byKey(const ValueKey('password'));
      await tester.enterText(passwordTextField, '1234567');

      //act
      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      //assert
      expect(find.text('Home Page'), findsOneWidget);
    },
  );
}
