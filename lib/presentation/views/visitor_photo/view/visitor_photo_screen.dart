import 'package:flutter/widgets.dart';
import 'package:proxyclick/presentation/views/visitor_photo/view/desktop/visitor_photo_screen_desktop.dart';
import 'package:proxyclick/presentation/widgets/helper/responsive.dart';

class VisitorPhotoScreen extends StatefulWidget {
  const VisitorPhotoScreen({super.key});

  @override
  State<VisitorPhotoScreen> createState() => _VisitorPhotoScreenState();
}

class _VisitorPhotoScreenState extends State<VisitorPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: VisitorPhotoScreenDesktop(),
      desktop: VisitorPhotoScreenDesktop(),
    );
  }
}
