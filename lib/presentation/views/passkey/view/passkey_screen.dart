import 'package:flutter/material.dart';
import 'package:proxyclick/presentation/views/passkey/view/desktop/passkey_screen_desktop.dart';
import 'package:proxyclick/presentation/views/passkey/view/mobile/passkey_sscreen_mobile.dart';
import 'package:proxyclick/presentation/widgets/helper/responsive.dart';

class PasskeyScreen extends StatelessWidget {
  const PasskeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: PasskeyScreenMobile(),
      desktop: PasskeyScreenDesktop(),
    );
  }
}
