import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/views/login/view_model/login_provider.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/cahange_password_dialog.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({super.key});

  @override
  State<LoginScreenMobile> createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
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
      body: Stack(
        fit: StackFit.loose,
        children: [
          SvgPicture.asset(AppAssets.mobile_bg, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInDown(
                  child: Center(
                    child: SizedBox(
                      height: 70,
                      child: Image.asset(AppAssets.logo, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                FadeInLeft(
                  child: AppTextField(
                    ctrl: nameController,
                    labelColor: AppPallets.white,
                    filled: true,
                    prefixIcon: HugeIcons.strokeRoundedUserCircle,
                    labelText: "Username",
                    hintText: 'Enter your username',
                  ),
                ),
                const SizedBox(height: 15),
                FadeInLeft(
                  child: AppTextField(
                    ctrl: passwordController,
                    prefixIcon: HugeIcons.strokeRoundedLockPassword,
                    isPassField: true,
                    labelColor: AppPallets.white,
                    filled: true,
                    labelText: "Password",
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: FadeInRight(
                    child: GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => const CahangePasswordDialog(),
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppPallets.white,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: AppPallets.white,
                          decorationThickness: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                FadeInLeft(
                  child: GradientButton(
                    isLoading: true,
                    enableBorder: true,
                    width: size.width,
                    label: 'Login',
                    onTap: () async {
                      await Future.delayed(const Duration(seconds: 2)).then(
                        (value) => context.pushNamed(RouteName.SplashScreen),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                FadeInLeft(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppPallets.white),
                        ),
                        TextSpan(
                          text: "Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // context.replace(RouteName.SignupScreen);
                              Router.neglect(
                                context,
                                () => context.goNamed(RouteName.SignupScreen),
                              );
                            },
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: AppPallets.white,
                                fontWeight: FontWeight.w600,
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
    );
  }
}
