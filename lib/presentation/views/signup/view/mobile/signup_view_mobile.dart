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
import 'package:proxyclick/presentation/views/signup/view_model/signup_provider.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

import '../../../../widgets/gradient_button.dart';

class SignupScreenMobile extends StatefulWidget {
  const SignupScreenMobile({super.key});

  @override
  State<SignupScreenMobile> createState() => _SignupScreenMobileState();
}

class _SignupScreenMobileState extends State<SignupScreenMobile> {
  late Timer _timer;
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    var signupProvider = Provider.of<SignupProvider>(context, listen: false);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      signupProvider.updateDotIndex();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: SvgPicture.asset(AppAssets.mobile_bg, fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
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
                  const SizedBox(height: 10),
                  FadeInLeft(
                    child: AppTextField(
                      ctrl: usernameController,
                      filled: true,
                      labelColor: AppPallets.white,
                      prefixIcon: HugeIcons.strokeRoundedUserCircle,
                      labelText: "Username",
                      hintText: 'Enter your username',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInLeft(
                    child: AppTextField(
                      ctrl: nameController,
                      prefixIcon: HugeIcons.strokeRoundedUserCircle,
                      filled: true,
                      labelColor: AppPallets.white,
                      labelText: "Fullname",
                      hintText: 'Enter your fullname',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInLeft(
                    child: AppTextField(
                      ctrl: emailController,
                      prefixIcon: HugeIcons.strokeRoundedMail02,
                      filled: true,
                      labelColor: AppPallets.white,
                      labelText: "Email",
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInLeft(
                    child: AppTextField(
                      ctrl: passwordController,
                      prefixIcon: HugeIcons.strokeRoundedLockPassword,
                      filled: true,
                      labelColor: AppPallets.white,
                      isPassField: true,
                      labelText: "Password",
                      hintText: 'Enter your password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInLeft(
                    child: Text(
                      "Company Logo",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 5),
                  FadeInLeft(
                    child: Container(
                      width: size.width,
                      height: 100,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppPallets.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(AppAssets.imgPlaceholder),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Upload Your Company Logo',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppPallets.font),
                                ),
                                Text(
                                  'Add the logo that represents your business best.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: AppPallets.fontGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInLeft(
                    child: GradientButton(
                      isLoading: true,
                      width: size.width,
                      enableBorder: true,
                      label: 'Sign up',
                      onTap: () async {
                        await Future.delayed(const Duration(seconds: 1)).then(
                          (value) => context.pushNamed(RouteName.PasskeyScreen),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInLeft(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: AppPallets.white),
                            ),
                            TextSpan(
                              text: "Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // context.replace(RouteName.LoginScreen);

                                  Router.neglect(
                                    context,
                                    () =>
                                        context.goNamed(RouteName.LoginScreen),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
