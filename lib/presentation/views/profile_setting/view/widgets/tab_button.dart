import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/presentation/views/profile_setting/view_model/profile_setting_view_model.dart';

import '../../../../../core/themes/colors.dart';

class TabButton extends StatelessWidget {
  final String label;
  final int index;

  const TabButton({super.key, required this.label, required this.index});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingProvider>(
      builder: (context, val, child) => GestureDetector(
        onTap: () {
          val.updateSelectedTab(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: val.selectedIndex == index
                ? const Border(
                    bottom: BorderSide(
                      width: 2,
                      color: AppPallets.focusedBorder,
                    ),
                  )
                : null,
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: val.selectedIndex == index
                  ? AppPallets.focusedBorder
                  : AppPallets.black,
              fontWeight: val.selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
