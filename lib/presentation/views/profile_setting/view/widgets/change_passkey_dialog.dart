import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/widgets/gradient_button.dart';

class changePasskeyDialog extends StatefulWidget {
  const changePasskeyDialog({super.key});

  @override
  State<changePasskeyDialog> createState() => _changePasskeyDialogState();
}

class _changePasskeyDialogState extends State<changePasskeyDialog> {
  TextEditingController newPasskey = TextEditingController();
  TextEditingController confirmPasskey = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 55,
    height: 55,
    decoration: BoxDecoration(
      border: Border.all(color: AppPallets.border),
      borderRadius: BorderRadius.circular(12),
    ),
  );
  final focusedPinTheme2 = PinTheme(
    width: 55,
    height: 55,
    decoration: BoxDecoration(
      border: Border.all(color: AppPallets.focusedBorder),
      borderRadius: BorderRadius.circular(12),
    ),
  );
  @override
  void dispose() {
    newPasskey.dispose();
    confirmPasskey.dispose();
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
              "Reset your Passkey",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppPallets.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter new 4 digit passkey",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Pinput(
                  controller: TextEditingController(),
                  length: 4,
                  defaultPinTheme: defaultPinTheme.copyWith(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.font,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  focusedPinTheme: focusedPinTheme2.copyWith(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.font,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm new 4 digit passkey",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Pinput(
                  controller: TextEditingController(),
                  length: 4,
                  defaultPinTheme: defaultPinTheme.copyWith(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.font,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  focusedPinTheme: focusedPinTheme2.copyWith(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppPallets.font,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GradientButton(label: "Update", width: 150, onTap: () async {}),
          ],
        ),
      ),
    );
  }
}
