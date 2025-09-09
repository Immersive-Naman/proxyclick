import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/widgets/helper/border_painter.dart';
import 'package:proxyclick/presentation/widgets/helper/hover.dart';

import '../../../../../core/themes/colors.dart';

class OptionsDialog extends StatelessWidget {
  const OptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SlideInDown(
                    child: OptionTile2(
                      title: "Visitor\nCheck-in",
                      image: AppAssets.checkin,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SlideInUp(
                    child: OptionTile2(
                      title: "For\nMeeting",
                      image: AppAssets.meeting,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SlideInDown(
                    child: OptionTile2(
                      title: "For\nDelivery",
                      image: AppAssets.delivery,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SlideInUp(
                    child: OptionTile2(
                      title: "For\nInterview",
                      image: AppAssets.interview,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SlideInDown(
                    child: OptionTile2(
                      title: "Visitor\nCheck-out",
                      image: AppAssets.checkout,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Make a selection below",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(width: 1, color: AppPallets.white),
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppPallets.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // const SizedBox(height: 50),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ZoomIn(
            //       child: OptionTile(
            //         icon: HugeIcons.strokeRoundedDoor02,
            //         label: "Visitor Check In",
            //         onTap: () {},
            //       ),
            //     ),
            //     ZoomIn(
            //       child: OptionTile(
            //         icon: HugeIcons.strokeRoundedUserGroup,
            //         label: "Meeting",
            //         onTap: () {},
            //       ),
            //     ),
            //     ZoomIn(
            //       child: OptionTile(
            //         icon: HugeIcons.strokeRoundedTruckDelivery,
            //         label: "Delivery",
            //         onTap: () {},
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 70),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ZoomIn(
            //       child: OptionTile(
            //         icon: HugeIcons.strokeRoundedJobSearch,
            //         label: "Interview",
            //         onTap: () {},
            //       ),
            //     ),
            //     const SizedBox(width: 100),
            //     ZoomIn(
            //       child: OptionTile(
            //         icon: HugeIcons.strokeRoundedDoor01,
            //         label: "Check Out",
            //         onTap: () {},
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class OptionTile2 extends StatelessWidget {
  final String title;
  final String image;

  const OptionTile2({super.key, required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: AppPallets.black.withOpacity(.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppPallets.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                  color: AppPallets.black,
                  size: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: BorderPainter(
        topLeftRadius: 12,
        bottomRightRadius: 12,
        strokeLength: 20,
      ),
      child: HoverBuilder(
        builder: (isHovered) => GestureDetector(
          onTap: onTap,
          child: Container(
            height: 120,
            width: 250,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isHovered ? null : const Color(0xFF161E31),
              gradient: isHovered ? AppPallets.radialGradient1 : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HugeIcon(icon: icon, color: AppPallets.white, size: 24.0),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                // const HugeIcon(
                //   icon: HugeIcons.strokeRoundedCircleArrowRight01,
                //   color: AppPallets.white,
                //   size: 30.0,
                // )
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppPallets.white, width: 2.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
