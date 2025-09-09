import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

class VisitorDetailScreen extends StatefulWidget {
  final String firstName;
  final String lastName;

  const VisitorDetailScreen({
    super.key,
    required this.firstName,
    required this.lastName,
  });
  @override
  State<VisitorDetailScreen> createState() => _VisitorDetailScreenState();
}

class _VisitorDetailScreenState extends State<VisitorDetailScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    print(widget.firstName);
    print(widget.lastName);
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
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
        child: SingleChildScrollView(
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
                        text: 'Kindly fill out your ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppPallets.black,
                        ),
                      ),
                      TextSpan(
                        text: 'profile details.',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppPallets.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        ctrl: firstNameController,
                        prefixIcon: HugeIcons.strokeRoundedUserCircle,
                        hintText: "Enter your first name",
                        labelText: "First Name",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: AppTextField(
                        ctrl: lastNameController,
                        prefixIcon: HugeIcons.strokeRoundedUserCircle,
                        hintText: "Enter your last name",
                        labelText: "Last Name",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        ctrl: emailController,
                        prefixIcon: HugeIcons.strokeRoundedMail02,
                        hintText: "Enter your email",
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: AppTextField(
                        ctrl: phoneController,
                        prefixIcon: HugeIcons.strokeRoundedSmartPhone01,
                        hintText: "Enter your phone number",
                        labelText: "Phone",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GradientButton(
                  label: 'Continue',
                  width: 150,
                  onTap: () async {
                    context.pushNamed(RouteName.VisitingNameScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
