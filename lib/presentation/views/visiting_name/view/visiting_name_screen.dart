import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

import '../../../../core/themes/colors.dart';

class VisitingNameScreen extends StatefulWidget {
  const VisitingNameScreen({super.key});

  @override
  State<VisitingNameScreen> createState() => _VisitingNameScreenState();
}

class _VisitingNameScreenState extends State<VisitingNameScreen> {
  TextEditingController visitingNameController = TextEditingController();

  @override
  void dispose() {
    visitingNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: CommanNavBar(),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Who are you ',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: AppPallets.black),
                    ),
                    TextSpan(
                      text: 'visiting?',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppPallets.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AppTextField(
                ctrl: visitingNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                prefixIcon: HugeIcons.strokeRoundedUserCircle,
                hintText: "Enter visiting name",
                labelText: "Visiting Name",
              ),
              const SizedBox(height: 30),
              GradientButton(
                label: 'Continue',
                width: 150,
                isLoading: false,
                onTap: () async {
                  context.pushNamed(RouteName.VisitorPhotoScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
