import 'package:flutter/material.dart';
import 'package:my_tdd/validator.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: const ValueKey('email'),
              validator: (value) =>
                  Validator().validateEmail(email: value ?? ''),
            ),
            TextFormField(
              key: const ValueKey('password'),
              validator: (value) =>
                  Validator().validatePassword(password: value ?? ''),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  }
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
