import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/core/utils/app_assets.dart';

class ThankyouScreen extends StatefulWidget {
  const ThankyouScreen({super.key});

  @override
  State<ThankyouScreen> createState() => _ThankyouScreenState();
}

class _ThankyouScreenState extends State<ThankyouScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  Future<void> navigateToHome() async {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      context.goNamed(RouteName.HomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: 600,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(AppAssets.isbLogo),
                const SizedBox(height: 20),
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedCheckmarkCircle04,
                  color: Colors.green,
                  size: 100.0,
                ),
                const SizedBox(height: 20),
                Text(
                  "You have been registered!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppPallets.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  '''Lorem Ipsum has been the industry's standard dummy text 
ever since the 1500s, when an unknown printer took a 
galley of type and scrambled''',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppPallets.black),
                ),
                const Spacer(),
                Image.asset(
                  AppAssets.logo,
                  color: AppPallets.black,
                  height: 50,
                ),
                const SizedBox(height: 20),
                Text(
                  'People check in to this company with Proxyclick.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppPallets.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Image.asset(
                AppAssets.thank,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
