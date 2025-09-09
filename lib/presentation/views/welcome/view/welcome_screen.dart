import 'package:flutter/material.dart';
import 'package:proxyclick/presentation/views/welcome/view/desktop/welcome_screen_desktop.dart';
import 'package:proxyclick/presentation/views/welcome/view/mobile/welcome_screen_mobile.dart';
import 'package:proxyclick/presentation/widgets/helper/responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: WelcomeScreenMobile(),
      desktop: WelcomeScreenDesktop(),
    );
  }
}
