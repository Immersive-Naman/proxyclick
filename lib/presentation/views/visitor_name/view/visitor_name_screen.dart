import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

class VisitorNameScreen extends StatefulWidget {
  const VisitorNameScreen({super.key});

  @override
  State<VisitorNameScreen> createState() => _VisitorNameScreenState();
}

class _VisitorNameScreenState extends State<VisitorNameScreen> {
  TextEditingController visitornameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    visitornameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, kToolbarHeight),
        child: const CommanNavBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width * .4,
            child: Form(
              key: formKey,
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
                          text: 'Hello, what’s your ',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: AppPallets.black),
                        ),
                        TextSpan(
                          text: 'name?',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                color: AppPallets.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    ctrl: visitornameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                    prefixIcon: HugeIcons.strokeRoundedUserCircle,
                    hintText: "Enter your name",
                    labelText: "Name",
                  ),
                  const SizedBox(height: 30),
                  GradientButton(
                    label: 'Continue',
                    width: 150,
                    isLoading: false,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        String firstName = visitornameController.text
                            .trim()
                            .split(' ')
                            .first;
                        String lastName = visitornameController.text
                            .split(' ')
                            .sublist(1)
                            .join(' ');
                        context.pushNamed(
                          RouteName.VisitorDetailScreen,
                          queryParameters: {
                            'firstName': firstName,
                            'lastName': lastName,
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
