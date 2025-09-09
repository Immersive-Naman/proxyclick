import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/presentation/views/visitor_photo/view/widgets/animated_gradient_border.dart';
import 'package:proxyclick/presentation/views/visitor_photo/view_model/visitor_photo_provider.dart';
import 'package:proxyclick/presentation/widgets/comman_nav_bar.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../core/utils/app_assets.dart';

class VisitorPhotoScreenDesktop extends StatefulWidget {
  const VisitorPhotoScreenDesktop({super.key});

  @override
  State<VisitorPhotoScreenDesktop> createState() =>
      _VisitorPhotoScreenDesktopState();
}

class _VisitorPhotoScreenDesktopState extends State<VisitorPhotoScreenDesktop> {
  late VisitorPhotoProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<VisitorPhotoProvider>(context, listen: false);
    provider.initializeCamera();
  }

  @override
  void dispose() {
    provider.disposeCamera();
    provider.uint8Image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 60),
        child: CommanNavBar(),
      ),
      body: Container(
        color: AppPallets.black.withOpacity(.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    AppAssets.profile_bg,
                    fit: BoxFit.cover,
                    height: 400,
                    width: 400,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedGradientBorder(
                      borderWidth: 5,
                      size: 310,
                      child: ClipOval(
                        child: Container(
                          height: 300,
                          width: 300, // Set the desired height here
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppPallets.white,
                              width: 3,
                            ), // Rounded corners
                          ),
                          child: Consumer<VisitorPhotoProvider>(
                            builder: (context, val, _) {
                              return val.uint8Image != null
                                  ? Transform.scale(
                                      scaleY: 1.1,
                                      scaleX: 1.1,
                                      child: Image.memory(
                                        val.uint8Image!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : val.cameraController?.value.isInitialized ??
                                        false
                                  ? Transform.scale(
                                      scaleY: 1.3,
                                      scaleX: 1.3,
                                      child: CameraPreview(
                                        val.cameraController!,
                                      ),
                                    )
                                  : const CircularProgressIndicator(
                                      color: AppPallets.white,
                                    );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Consumer<VisitorPhotoProvider>(
              builder: (context, val, _) {
                return GradientButton(
                  label: val.uint8Image == null ? "Take Photo" : "Continue",
                  width: 150,
                  onTap: () async {
                    if (val.uint8Image != null) {
                      context.pushNamed(RouteName.AgreementScreen);
                    } else {
                      await val.capturePhoto();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
