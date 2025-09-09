import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Image.asset(
                AppAssets.isbLogo,
                // scale: .7,
              ),
            ),
            const SizedBox(height: 15),
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: Center(
                child: Text(
                  "Account setup ongoing",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppPallets.font,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            FadeInDown(
              delay: const Duration(milliseconds: 600),
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppPallets.gradient1, size: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
