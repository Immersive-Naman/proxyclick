import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/presentation/views/home/view/widgets/option_dialog.dart';
import 'package:proxyclick/presentation/views/home/view_model/home_provider.dart';

import '../../../../../core/themes/colors.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, val, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                val.updateIndex(0);
              },
              child: Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: val.selectedIndex == 0 ? AppPallets.white : null,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome12,
                  color: val.selectedIndex == 0
                      ? AppPallets.black
                      : AppPallets.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                val.updateIndex(1);
                showDialog(
                  context: context,
                  builder: (context) => const OptionsDialog(),
                ).then((value) => val.updateIndex(0));
              },
              child: Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: val.selectedIndex == 1 ? AppPallets.white : null,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedDashboardSquare01,
                  color: val.selectedIndex == 1
                      ? AppPallets.black
                      : AppPallets.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                val.updateIndex(2);
              },
              child: Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: val.selectedIndex == 2 ? AppPallets.white : null,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedCheckmarkSquare04,
                  color: val.selectedIndex == 2
                      ? AppPallets.black
                      : AppPallets.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                val.updateIndex(3);
              },
              child: Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: val.selectedIndex == 3 ? AppPallets.white : null,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedLogoutSquare02,
                  color: val.selectedIndex == 3
                      ? AppPallets.black
                      : AppPallets.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
