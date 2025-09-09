import 'package:animate_do/animate_do.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/widgets/color_selector.dart';
import 'package:proxyclick/presentation/widgets/dropdown.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

class BrandSettingg extends StatefulWidget {
  const BrandSettingg({super.key});

  @override
  State<BrandSettingg> createState() => _BrandSettinggState();
}

class _BrandSettinggState extends State<BrandSettingg> {
  final TextEditingController brand = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: size.width > 1024 ? size.width * .55 : 700,
        child: ScrollConfiguration(
          behavior: NoScrollbarScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * .05),
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Light Logo",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(color: AppPallets.black),
                          ),
                          const SizedBox(height: 10),
                          DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              color: AppPallets.border,
                              radius: const Radius.circular(12),
                              dashPattern: const [10, 4],
                            ),
                            child: Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                color: AppPallets.grey2,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const HugeIcon(
                                    icon: HugeIcons.strokeRoundedImageUpload,
                                    color: Colors.black,
                                    size: 32.0,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Upload Brand Logo",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppPallets.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "upload image in jpg, png, gif",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppPallets.fontGrey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dark Logo",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(color: AppPallets.black),
                          ),
                          const SizedBox(height: 10),
                          DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              color: AppPallets.border,
                              radius: const Radius.circular(12),
                              dashPattern: const [10, 4],
                            ),
                            child: Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                color: AppPallets.grey2,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const HugeIcon(
                                    icon: HugeIcons.strokeRoundedImageUpload,
                                    color: Colors.black,
                                    size: 32.0,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Upload Brand Logo",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppPallets.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "upload image in jpg, png, gif",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppPallets.fontGrey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                FadeInDown(
                  delay: const Duration(milliseconds: 300),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: AppTextField(
                          prefixIcon: HugeIcons.strokeRoundedTextSmallcaps,
                          hintText: 'Enter brand name',
                          labelText: "Brand Name",
                          ctrl: brand,
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: CustomDropdownMenu(
                          options: const ["English", 'Hindi'],
                          onSelect: (value) {},
                          selectedValue: 'English',
                          label: 'Default Language',
                        ),
                      ),
                      const VerticalDivider(),
                      const Expanded(
                        child: CustomColorSelector(
                          label: 'Change heading text color',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FadeInDown(
                  delay: const Duration(milliseconds: 400),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: CustomColorSelector(
                          label: 'Change sub-heading text color',
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: CustomDropdownMenu(
                          options: const ["18px", '20px', '22px', '24px'],
                          onSelect: (value) {},
                          selectedValue: '18px',
                          label: 'Sub-Heading font size',
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: CustomDropdownMenu(
                          options: const ["18px", '20px', '22px', '24px'],
                          onSelect: (value) {},
                          selectedValue: '18px',
                          label: 'Heading font size',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FadeInDown(
                  delay: const Duration(milliseconds: 500),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomColorSelector(
                          label: 'Banner image button bg color',
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: CustomColorSelector(
                          label: 'Banner image button text color',
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: CustomColorSelector(
                          label: 'Button backround color',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: CustomColorSelector(label: 'Button text color'),
                      ),
                      const VerticalDivider(),
                      const Expanded(
                        child: CustomColorSelector(label: 'Input label color'),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: CustomDropdownMenu(
                          options: const ["18px", '20px', '22px', '24px'],
                          onSelect: (value) {},
                          selectedValue: '18px',
                          label: 'Input label font size',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  child: GradientButton(
                    label: "Save Settings",
                    width: 200,
                    onTap: () async {},
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoScrollbarScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // Removes the overscroll glow or other indicators
  }

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // Removes the scrollbar
  }
}
