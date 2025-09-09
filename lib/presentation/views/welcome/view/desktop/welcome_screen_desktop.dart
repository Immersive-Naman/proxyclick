import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/utils/app_assets.dart';

class WelcomeScreenDesktop extends StatefulWidget {
  const WelcomeScreenDesktop({super.key});

  @override
  State<WelcomeScreenDesktop> createState() => _WelcomeScreenDesktopState();
}

class _WelcomeScreenDesktopState extends State<WelcomeScreenDesktop>
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
            AppAssets.welcome1,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  AppAssets.logo,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              SizedBox(height: 33, width: size.width),
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 500),
                child: Text(
                  "The Modern Way to Manage Visitors",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 43, width: size.width),
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    context.goNamed(RouteName.LoginScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Get Started",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(width: 32),
                        AnimatedBuilder(
                            animation: actrl,
                            builder: (context, _) {
                              return Transform.translate(
                                  offset: Offset(shakeAnimation.value, 0),
                                  child: SvgPicture.asset(AppAssets.arrows));
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ],
      ),
    );
  }
}
