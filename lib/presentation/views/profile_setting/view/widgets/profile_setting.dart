import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/cahange_password_dialog.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/change_passkey_dialog.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/helper/hover.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

import '../../../../../core/themes/colors.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final TextEditingController username = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    fullname.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width > 1024 ? size.width * .55 : 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * .05),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: AppPallets.border),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage(AppAssets.isbLogo),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: AppPallets.border,
                          ),
                          shape: BoxShape.circle,
                          color: AppPallets.white,
                        ),
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedPencilEdit02,
                          color: AppPallets.black,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppTextField(
                        prefixIcon: HugeIcons.strokeRoundedUserCircle,
                        hintText: 'Enter username',
                        labelText: 'Username',
                        ctrl: username,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: AppTextField(
                        prefixIcon: HugeIcons.strokeRoundedUserCircle,
                        hintText: 'Enter full name',
                        labelText: 'Full Name',
                        ctrl: fullname,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppTextField(
                        prefixIcon: HugeIcons.strokeRoundedMail02,
                        hintText: 'Enter email',
                        labelText: 'Email',
                        ctrl: email,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: AppTextField(
                        prefixIcon: HugeIcons.strokeRoundedSmartPhone01,
                        hintText: 'Enter phone number',
                        labelText: 'Phone',
                        ctrl: phone,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: GradientButton(
                  label: 'Save Profile',
                  width: 160,
                  onTap: () async {},
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZoomIn(
                    delay: const Duration(milliseconds: 600),
                    child: HoverBuilder(
                      builder: (hover) {
                        return GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (_) => const CahangePasswordDialog(),
                          ),
                          child: Text(
                            "Change Password?",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: hover
                                      ? AppPallets.focusedBorder
                                      : AppPallets.fontGrey,
                                  decoration: TextDecoration.underline,
                                  decorationColor: hover
                                      ? AppPallets.focusedBorder
                                      : AppPallets.fontGrey,
                                  decorationThickness: 1,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  ZoomIn(
                    delay: const Duration(milliseconds: 600),
                    child: HoverBuilder(
                      builder: (hover) {
                        return GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => const changePasskeyDialog(),
                          ),
                          child: Text(
                            "Change Passkey?",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: hover
                                      ? AppPallets.focusedBorder
                                      : AppPallets.fontGrey,
                                  decoration: TextDecoration.underline,
                                  decorationColor: hover
                                      ? AppPallets.focusedBorder
                                      : AppPallets.fontGrey,
                                  decorationThickness: 1,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
