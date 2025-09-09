import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';

class PasskeyDialog extends StatelessWidget {
  const PasskeyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppPallets.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.passkey, height: 120),
              const SizedBox(height: 20),
              Text(
                "Please enter your passkey to access your profile",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: AppPallets.black),
              ),
              const SizedBox(height: 20),
              Pinput(
                length: 4,
                defaultPinTheme: PinTheme(
                  margin: const EdgeInsets.all(8),
                  width: 55,
                  height: 55,
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                  margin: const EdgeInsets.all(8),
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppPallets.font,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppPallets.focusedBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GradientButton(
                label: "Verify",
                width: 150,
                isLoading: true,
                onTap: () async {
                  await Future.delayed(const Duration(seconds: 2)).then((
                    value,
                  ) {
                    context.pop();
                    context.pushNamed(RouteName.ProfileSettingScreen);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
