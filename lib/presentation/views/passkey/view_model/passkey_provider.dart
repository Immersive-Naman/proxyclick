import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:proxyclick/core/themes/colors.dart';

class PasskeyProvider extends ChangeNotifier {
  int selectedDot = 0;
  final focusedPinTheme = PinTheme(
    width: 55,
    height: 55,
    decoration: BoxDecoration(
      border: Border.all(color: AppPallets.focusedBorder),
      borderRadius: BorderRadius.circular(12),
    ),
  );
  void updateDotIndex() {
    if (selectedDot < 2) {
      selectedDot++;
    } else {
      selectedDot = 0;
    }
    notifyListeners();
  }
}
