import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';

class VisitorProfileScreen extends StatefulWidget {
  const VisitorProfileScreen({super.key});

  @override
  State<VisitorProfileScreen> createState() => _VisitorProfileScreenState();
}

class _VisitorProfileScreenState extends State<VisitorProfileScreen>
    with SingleTickerProviderStateMixin {
  int count = 5;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        timer.cancel();
        context.pushNamed(RouteName.ThankyouScreen);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommanNavBar(),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: 250,
              width: 650,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppAssets.card_bg),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: AppPallets.border),
                    ),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundColor: AppPallets.focusedBorder,
                    ),
                  ),
                  const VerticalDivider(color: Colors.transparent),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "John Doe",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppPallets.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Immersive Infotech",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppPallets.black,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 1,
                        color: AppPallets.border,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Visiting ',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: AppPallets.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            TextSpan(
                              text: 'Paul',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: AppPallets.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          context.goNamed(RouteName.VisitorNameScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppPallets.border,
                            ),
                          ),
                          child: Text(
                            "Edit Details",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppPallets.font),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 620,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppPallets.card_grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Meeting at  ',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: AppPallets.black,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        TextSpan(
                          text: '2:45 PM',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: AppPallets.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedClock01,
                    color: AppPallets.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "You will be checked in after",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppPallets.black),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LottieBuilder.asset(AppAssets.countdown),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      count.toString(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppPallets.focusedBorder,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
