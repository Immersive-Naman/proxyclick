import 'package:flutter/material.dart';

class ProfileSettingProvider extends ChangeNotifier {
  final PageController pageController = PageController(
    initialPage: 0,
  );
  int selectedIndex = 0;
  void updateSelectedTab(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }
}
