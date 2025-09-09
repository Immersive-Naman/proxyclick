import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/views/passkey/view_model/passkey_provider.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';

class PasskeyScreenMobile extends StatefulWidget {
  const PasskeyScreenMobile({super.key});

  @override
  State<PasskeyScreenMobile> createState() => _PasskeyScreenMobileState();
}

class _PasskeyScreenMobileState extends State<PasskeyScreenMobile> {
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
      body: Stack(
        children: [
          SvgPicture.asset(AppAssets.mobile_bg, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  child: Center(
                    child: SizedBox(
                      height: 70,
                      child: Image.asset(
                        AppAssets.logo,
                        color: AppPallets.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeInDown(
                  child: Center(
                    child: SizedBox(
                      height: size.height * .15,
                      child: Image.asset(
                        AppAssets.passkey,
                        color: AppPallets.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                FadeInLeft(
                  child: Center(
                    child: Text(
                      "Add a passkey for stronger security",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FadeInLeft(
                  child: Center(
                    child: Text(
                      "Enter 4 digit Passkey",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppPallets.white.withOpacity(.7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                FadeInLeft(
                  child: Center(
                    child: Pinput(
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 55,
                        height: 55,
                        textStyle: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppPallets.border),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 55,
                        height: 55,
                        textStyle: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppPallets.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                FadeInLeft(
                  child: GradientButton(
                    isLoading: true,
                    width: size.width,
                    enableBorder: true,
                    label: 'Submit',
                    onTap: () async {
                      await Future.delayed(const Duration(seconds: 1)).then(
                        (value) => context.goNamed(RouteName.SplashScreen),
                      );
                    },
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
