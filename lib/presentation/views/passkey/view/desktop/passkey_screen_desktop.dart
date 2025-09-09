import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/core/utils/app_icons.dart';
import 'package:proxyclick/presentation/views/passkey/view_model/passkey_provider.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/icons.dart';

class PasskeyScreenDesktop extends StatefulWidget {
  const PasskeyScreenDesktop({super.key});

  @override
  State<PasskeyScreenDesktop> createState() => _PasskeyScreenDesktopState();
}

class _PasskeyScreenDesktopState extends State<PasskeyScreenDesktop> {
  late Timer _timer;
  @override
  void initState() {
    var passkeyProvider = Provider.of<PasskeyProvider>(context, listen: false);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      passkeyProvider.updateDotIndex();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * .4,
            height: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(size.width * .04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    child: Center(
                      child: SizedBox(
                        height: 70,
                        child: Image.asset(AppAssets.logo, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: Center(
                      child: SizedBox(
                        height: size.height * .2,
                        child: Image.asset(AppAssets.passkey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SlideInLeft(
                    delay: const Duration(milliseconds: 200),
                    child: Center(
                      child: Text(
                        "Add a passkey for stronger security",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppPallets.font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SlideInLeft(
                    delay: const Duration(milliseconds: 300),
                    child: Center(
                      child: Text(
                        "Enter 4 digit Passkey",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppPallets.fontGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SlideInLeft(
                    delay: const Duration(milliseconds: 400),
                    child: Center(
                      child: Pinput(
                        controller: TextEditingController(),
                        length: 4,
                        defaultPinTheme: PinTheme(
                          width: 55,
                          height: 55,
                          textStyle: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: AppPallets.font,
                                fontWeight: FontWeight.bold,
                              ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppPallets.border),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 55,
                          height: 55,
                          textStyle: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: AppPallets.font,
                                fontWeight: FontWeight.w600,
                              ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppPallets.focusedBorder),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SlideInLeft(
                    delay: const Duration(milliseconds: 500),
                    child: GradientButton(
                      isLoading: true,
                      width: size.width,
                      label: 'Submit',
                      onTap: () async {
                        await Future.delayed(const Duration(seconds: 3)).then(
                          (value) => context.goNamed(RouteName.SplashScreen),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(AppAssets.login_bg, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: SlideInRight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const MyIcon(
                          icon: AppIcons.info,
                          color: AppPallets.white,
                        ),
                        Text(
                          "About Us",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: size.width * .05,
                  right: size.width * .03,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInDown(
                        delay: const Duration(milliseconds: 500),
                        child: Text(
                          "Enterprise visitor management",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInDown(
                        delay: const Duration(milliseconds: 600),
                        child: Text(
                          '''Proxyclick is a customizable, cloud-based solution, that enables leading businesses to take control of their people flows. It provides a single interface to manage visitors, employees, contractors, and anyone else on premises, while improving security, efficiency, compliance, and branding.''',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 32),
                      FadeInDown(
                        delay: const Duration(milliseconds: 700),
                        child: Consumer<PasskeyProvider>(
                          builder: (context, value, _) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: value.selectedDot == 0
                                      ? AppPallets.white
                                      : null,
                                  border: value.selectedDot == 0
                                      ? null
                                      : Border.all(
                                          width: 1,
                                          color: AppPallets.white,
                                        ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: value.selectedDot == 1
                                      ? AppPallets.white
                                      : null,
                                  border: value.selectedDot == 1
                                      ? null
                                      : Border.all(
                                          width: 1,
                                          color: AppPallets.white,
                                        ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: value.selectedDot == 2
                                      ? AppPallets.white
                                      : null,
                                  border: value.selectedDot == 2
                                      ? null
                                      : Border.all(
                                          width: 1,
                                          color: AppPallets.white,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
