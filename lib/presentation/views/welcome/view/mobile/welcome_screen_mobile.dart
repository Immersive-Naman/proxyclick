import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/utils/app_assets.dart';

import '../widgets/arrow_button.dart';

class WelcomeScreenMobile extends StatefulWidget {
  const WelcomeScreenMobile({super.key});

  @override
  State<WelcomeScreenMobile> createState() => _WelcomeScreenMobileState();
}

class _WelcomeScreenMobileState extends State<WelcomeScreenMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController actrl;
  late Animation<double> shakeAnimation;
  late var welcome;
  @override
  void initState() {
    actrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    shakeAnimation = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(
        parent: actrl,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    actrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.mobile_bg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                child: Image.asset(
                  AppAssets.logo,
                  fit: BoxFit.cover,
                  height: 75,
                ),
              ),
              SizedBox(height: 33, width: size.width),
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  "The Modern Way to Manage Visitors",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 43, width: size.width),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: ArrowButton(
                  title: "Get Started",
                  onTap: () => context.pushNamed(RouteName.LoginScreen),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
