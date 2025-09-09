import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';
import 'package:proxyclick/presentation/widgets/textfield.dart';

class CahangePasswordDialog extends StatefulWidget {
  const CahangePasswordDialog({super.key});

  @override
  State<CahangePasswordDialog> createState() => _CahangePasswordDialogState();
}

class _CahangePasswordDialogState extends State<CahangePasswordDialog> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newePassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    oldPassword.dispose();
    newePassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppPallets.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(32),
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Reset your Password",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppPallets.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            AppTextField(
              isPassField: true,
              prefixIcon: HugeIcons.strokeRoundedLockPassword,
              hintText: "Enter old password",
              labelText: "Old Password",
              ctrl: oldPassword,
            ),
            const SizedBox(height: 20),
            AppTextField(
              isPassField: true,
              prefixIcon: HugeIcons.strokeRoundedLockPassword,
              hintText: "Enter new password",
              labelText: "New Password",
              ctrl: newePassword,
            ),
            const SizedBox(height: 20),
            AppTextField(
              isPassField: true,
              prefixIcon: HugeIcons.strokeRoundedLockPassword,
              hintText: "Enter new password again",
              labelText: "Confirm Password",
              ctrl: confirmPassword,
            ),
            const SizedBox(height: 30),
            GradientButton(label: "Update", width: 150, onTap: () async {}),
          ],
        ),
      ),
    );
  }
}
