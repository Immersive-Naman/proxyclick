import 'package:flutter/material.dart';
import 'package:proxyclick/core/extensions/size.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.isMobileView) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
