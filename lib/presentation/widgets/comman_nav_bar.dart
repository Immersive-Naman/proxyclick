import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';

class CommanNavBar extends StatelessWidget {
  final bool istitle;
  final Widget? widget;

  const CommanNavBar({super.key, this.istitle = true, this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        boxShadow: [AppPallets.shadow],
        color: AppPallets.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Material(
              shape: StadiumBorder(),
              color: AppPallets.white,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppPallets.black,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Back",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppPallets.black,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ]),
            ),
          ),
          // TextButton.icon(
          //     onPressed: () => context.pop(),
          //     icon: const Icon(
          //       Icons.arrow_back_ios_new_rounded,
          //       color: AppPallets.black,
          //       size: 15,
          //     ),
          //     label: Text(
          //       "Back",
          //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //             color: AppPallets.black,
          //             fontWeight: FontWeight.w500,
          //           ),
          //     )),
          // const Spacer(),

          if (istitle)
            Text(
              "Welcome to International School of Bombay",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppPallets.black,
                  ),
            ),
          if (widget != null && !istitle) widget!,

          Image.asset(AppAssets.isbLogo),
        ],
      ),
    );
  }
}
