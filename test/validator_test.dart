import 'package:flutter_test/flutter_test.dart';
import 'package:my_tdd/validator.dart';

void main() {
  test('test empty email validation', () {
    //arrange
    final validator = Validator();

    //act
    final validation = validator.validateEmail(email: '');

    //assert
    expect(validation, equals("Field required"));
  });

  test('test invalid email validation', () {
    //arrange
    final validator = Validator();

    //act
    final validation1 = validator.validateEmail(email: 'mazen@gmailcom');
    final validation2 = validator.validateEmail(email: 'mazengmail.com');
    final validation3 = validator.validateEmail(email: 'mazen@gmail.');
    final validation4 = validator.validateEmail(email: 'mazen');

    //assert
    expect(validation1, equals("Invalid email address"));
    expect(validation2, equals("Invalid email address"));
    expect(validation3, equals("Invalid email address"));
    expect(validation4, equals("Invalid email address"));
  });

  test('test valid email validation', () {
    //arrange
    final validator = Validator();

    //act
    final validation = validator.validateEmail(email: 'mazen@gmail.com');

    //assert
    expect(validation, isNull);
  });

  test('test invalid password validation', () {
    //arrange
    final validator = Validator();

    //act
    final validation1 = validator.validatePassword(password: '');
    final validation2 = validator.validatePassword(password: '1234');

    //assert
    expect(validation1, equals("Field required"));
    expect(validation2, equals("Invalid password"));
  });

  test('test valid password validation', () {
    //arrange
    final validator = Validator();

    //act
    final validation = validator.validatePassword(password: '123456');

    //assert
    expect(validation, isNull);
  });
}
