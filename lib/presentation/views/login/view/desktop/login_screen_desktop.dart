import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/core/utils/app_icons.dart';
import 'package:proxyclick/presentation/views/login/view_model/login_provider.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/cahange_password_dialog.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/icons.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

class LoginScreenDesktop extends StatefulWidget {
  const LoginScreenDesktop({super.key});

  @override
  State<LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {
  late Timer _timer;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    var logginProvider = Provider.of<LoginProvider>(context, listen: false);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      logginProvider.updateDotIndex();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    nameController.dispose();
    passwordController.dispose();
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
                  const SizedBox(height: 15),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 100),
                    child: AppTextField(
                      ctrl: nameController,
                      prefixIcon: HugeIcons.strokeRoundedUserCircle,
                      labelText: "Username",
                      hintText: 'Enter your username',
                    ),
                  ),
                  const SizedBox(height: 15),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 200),
                    child: AppTextField(
                      ctrl: passwordController,
                      prefixIcon: HugeIcons.strokeRoundedLockPassword,
                      isPassField: true,
                      labelText: "Password",
                      hintText: 'Enter your password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 300),
                      child: GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const CahangePasswordDialog(),
                        ),
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: AppPallets.focusedBorder,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 300),
                    child: GradientButton(
                      isLoading: true,
                      width: size.width,
                      label: 'Login',
                      onTap: () async {
                        await Future.delayed(const Duration(seconds: 3)).then(
                          (value) => context.goNamed(RouteName.HomeScreen),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 400),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: AppPallets.font),
                            ),
                            TextSpan(
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // context.replace(RouteName.SignupScreen);
                                  Router.neglect(
                                    context,
                                    () =>
                                        context.goNamed(RouteName.SignupScreen),
                                  );
                                },
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                    color: AppPallets.focusedBorder,
                                    fontWeight: FontWeight.w600,
                                  ),
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
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(AppAssets.login_bg, fit: BoxFit.cover),
                Positioned(
                  top: 20,
                  right: 20,
                  child: FadeInRight(
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
                        child: Consumer<LoginProvider>(
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
