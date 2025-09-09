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
import 'package:proxyclick/core/utils/app_icons.dart';
import 'package:proxyclick/presentation/views/signup/view_model/signup_provider.dart';
import 'package:proxyclick/presentation/widgets/icons.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

import '../../../../widgets/gradient_button.dart';

class SignupScreenDesktop extends StatefulWidget {
  const SignupScreenDesktop({super.key});

  @override
  State<SignupScreenDesktop> createState() => _SignupScreenDesktopState();
}

class _SignupScreenDesktopState extends State<SignupScreenDesktop> {
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
      body: Row(
        children: [
          Container(
            width: size.width * .4,
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
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
                          child: Image.asset(
                            AppAssets.logo,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 100),
                      child: AppTextField(
                        ctrl: usernameController,
                        prefixIcon: HugeIcons.strokeRoundedUserCircle,
                        labelText: "Username",
                        hintText: 'Enter your username',
                      ),
                    ),
                    const SizedBox(height: 15),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 100),
                      child: AppTextField(
                        ctrl: nameController,
                        prefixIcon: HugeIcons.strokeRoundedUserCircle,
                        labelText: "Fullname",
                        hintText: 'Enter your fullname',
                      ),
                    ),
                    const SizedBox(height: 15),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 100),
                      child: AppTextField(
                        ctrl: emailController,
                        prefixIcon: HugeIcons.strokeRoundedMail02,
                        labelText: "Email",
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 15),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 200),
                      child: AppTextField(
                        ctrl: passwordController,
                        prefixIcon: HugeIcons.strokeRoundedLockPassword,
                        isPassField: true,
                        labelText: "Password",
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(height: 15),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 300),
                      child: Text(
                        "Company Logo",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 300),
                      child: Container(
                        width: size.width,
                        height: 150,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppPallets.border),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: AppPallets.font),
                                  ),
                                  Text(
                                    'Add the logo that represents your business best.',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
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
                    SlideInLeft(
                      delay: const Duration(milliseconds: 400),
                      child: GradientButton(
                        isLoading: true,
                        width: size.width,
                        label: 'Sign up',
                        onTap: () async {
                          await Future.delayed(const Duration(seconds: 3)).then(
                            (value) => context.goNamed(RouteName.PasskeyScreen),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SlideInLeft(
                      delay: const Duration(milliseconds: 500),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: AppPallets.font),
                              ),
                              TextSpan(
                                text: "Sign In",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // context.replace(RouteName.LoginScreen);

                                    Router.neglect(
                                      context,
                                      () => context.goNamed(
                                        RouteName.LoginScreen,
                                      ),
                                    );
                                  },
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(
                                      color: AppPallets.gradient1,
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
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                RotatedBox(
                  quarterTurns: 1,
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
                        child: Consumer<SignupProvider>(
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
