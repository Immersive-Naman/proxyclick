import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/views/home/view/widgets/bottom_menu.dart';
import 'package:proxyclick/presentation/views/home/view/widgets/passkey_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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

    shakeAnimation = Tween<double>(
      begin: -5.0,
      end: 5.0,
    ).animate(CurvedAnimation(parent: actrl, curve: Curves.easeInOut));
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
        fit: StackFit.expand,
        children: [
          Image.asset(AppAssets.welcome_bg, fit: BoxFit.cover),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(color: AppPallets.black.withOpacity(0.3)),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: SlideInRight(
              child: PopupMenuButton(
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppPallets.white,
                constraints: const BoxConstraints(maxWidth: 130),
                offset: const Offset(0, 10),
                tooltip: '',
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PasskeyDialog(),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedUserCircle,
                          color: AppPallets.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: AppPallets.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedLogoutSquare02,
                          color: AppPallets.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Logout",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: AppPallets.black),
                        ),
                      ],
                    ),
                  ),
                ],
                child: Row(
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedSetting07,
                      color: AppPallets.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Setting",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeInDown(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome to",
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(fontSize: 48),
                          ),
                          TextSpan(
                            text: " International\nSchool of Bombay",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  FadeInDown(
                    delay: const Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(RouteName.VisitorNameScreen);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Check-In",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 32),
                            AnimatedBuilder(
                              animation: actrl,
                              builder: (context, _) {
                                return Transform.translate(
                                  offset: Offset(shakeAnimation.value, 0),
                                  child: SvgPicture.asset(AppAssets.arrows),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SlideInLeft(child: Image.asset(AppAssets.isbLogoWhite)),
                  const Spacer(),
                  SlideInRight(child: const BottomMenu()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
