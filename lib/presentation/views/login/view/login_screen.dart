import 'package:flutter/material.dart';
import 'package:proxyclick/presentation/views/login/view/desktop/login_screen_desktop.dart';
import 'package:proxyclick/presentation/views/login/view/mobile/login_screen_mobile.dart';
import 'package:proxyclick/presentation/widgets/helper/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: LoginScreenMobile(),
      desktop: LoginScreenDesktop(),
    );
  }
}
