class Validator {
  String? validateEmail({required String email}) {
    if (email.isEmpty) return "Field required";

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(email) ? null : "Invalid email address";
  }

  String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return "Field required";
    } else if (password.length < 6) {
      return "Invalid password";
    }
    return null;
  }
}
