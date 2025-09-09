import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int selectedDot = 0;
  void updateDotIndex() {
    if (selectedDot < 2) {
      selectedDot++;
    } else {
      selectedDot = 0;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
