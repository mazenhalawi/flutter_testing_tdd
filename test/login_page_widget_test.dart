import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_tdd/login_page.dart';

void main() {
  testWidgets('Login page has email input text field', (tester) async {
    //arrange
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    //act
    Finder emailTextField = find.byKey(const ValueKey('email'));

    //assert
    expect(emailTextField, findsOneWidget);
  });

  testWidgets('Login page has password input text field', (tester) async {
    //arrange
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    //act
    Finder passwordTextField = find.byKey(const ValueKey('password'));

    //assert
    expect(passwordTextField, findsOneWidget);
  });

  testWidgets('Login page has login button', (tester) async {
    //arrange
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    //act
    Finder loginButtonText = find.text("Login");
    Finder loginButton = find.byType(ElevatedButton);

    //assert
    expect(loginButton, findsOneWidget);
    expect(loginButtonText, findsOneWidget);
  });
}
