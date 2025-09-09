import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/background.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/brand_setting.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/profile_setting.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/tab_button.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';

import '../view_model/profile_setting_view_model.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommanNavBar(
          istitle: false,
          widget: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(label: "Profile Setting", index: 0),
              TabButton(label: "Brand Setting", index: 1),
              TabButton(label: "Change Background", index: 2),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Consumer<ProfileSettingProvider>(
            builder: (context, val, _) {
              return PageView.builder(
                controller: val.pageController,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const ProfileSetting();
                    case 1:
                      return const BrandSettingg();
                    case 2:
                      return const ChangeBackground();
                  }
                  return null;
                },
              );
            },
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.cover,
              height: 50,
              color: AppPallets.focusedBorder,
            ),
          ),
        ],
      ),
    );
  }
}
