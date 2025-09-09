import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';
import 'package:proxyclick/presentation/widgets/custom_switch.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class AgreementScreen extends StatelessWidget {
  AgreementScreen({super.key});
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommanNavBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .1),
                  Center(
                    child: Text(
                      "Visitor instruction and confidentiality agreement",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppPallets.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome! We are pleased to have you as a guest if pristiner food at your facilities.",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppPallets.black),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: size.width,
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        SfSignaturePad(
                          key: _signaturePadKey,
                          minimumStrokeWidth: 2,
                          maximumStrokeWidth: 3,
                          strokeColor: AppPallets.black,
                          backgroundColor: AppPallets.white,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Sign here with your figner",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                  color: AppPallets.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              _signaturePadKey.currentState!.clear();
                            },
                            child: Text(
                              "Clear",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    color: AppPallets.fontGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppPallets.border),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Doe",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  color: AppPallets.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "Friday, Nov 22, 2024",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppPallets.black,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomSwitch(
                                value: true,
                                height: 25,
                                width: 50,
                                activeColor: AppPallets.focusedBorder,
                                inactiveColor: AppPallets.border,
                                onChanged: (value) {},
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Send me a copy by email",
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: AppPallets.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GradientButton(
                        label: 'Agree',
                        width: 150,
                        onTap: () async {
                          context.pushNamed(RouteName.VisitorProfileScreen);
                        },
                      ),
                    ],
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
