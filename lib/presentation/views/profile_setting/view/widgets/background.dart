import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';

class ChangeBackground extends StatelessWidget {
  const ChangeBackground({super.key});
  static final List<String> images = [
    AppAssets.img1,
    AppAssets.img2,
    AppAssets.img3,
    AppAssets.img4,
    AppAssets.img5,
    AppAssets.img1,
    AppAssets.img2,
    AppAssets.img3,
    AppAssets.img4,
    AppAssets.img5
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: size.width > 1024 ? size.width * .7 : 550,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .05),
              Row(
                children: [
                  Text(
                    "Select Background",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.radio_button_checked_rounded,
                      color: AppPallets.focusedBorder, size: 24),
                  const SizedBox(width: 5),
                  Text(
                    "Static",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.radio_button_off_rounded,
                      color: AppPallets.black, size: 24),
                  const SizedBox(width: 5),
                  Text(
                    "Motion",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.radio_button_off_rounded,
                      color: AppPallets.black, size: 24),
                  const SizedBox(width: 5),
                  Text(
                    "Solid/Gradient",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppPallets.black),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 4),
                itemBuilder: (context, index) => ZoomIn(
                  duration: Duration(milliseconds: 100 * (index + 5)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
