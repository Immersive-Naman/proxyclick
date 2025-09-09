import 'package:flutter/material.dart';
import 'package:proxyclick/presentation/views/signup/view/desktop/signup_view_desktop.dart';
import 'package:proxyclick/presentation/views/signup/view/mobile/signup_view_mobile.dart';
import 'package:proxyclick/presentation/widgets/helper/responsive.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: SignupScreenMobile(),
      desktop: SignupScreenDesktop(),
    );
  }
}
