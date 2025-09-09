import 'package:flutter/material.dart';
import 'package:proxyclick/core/themes/colors.dart';

class CustomColorSelector extends StatelessWidget {
  const CustomColorSelector({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) => Dialog(
            //     backgroundColor: AppPallets.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: SizedBox(
            //       width: 350,
            //       height: 600,
            //       child: Padding(
            //         padding: const EdgeInsets.all(32),
            //         child: ColorPicker(
            //           pickerColor: AppPallets.black,
            //           portraitOnly: true,
            //           colorPickerWidth: 300,
            //           labelTextStyle: Theme.of(context)
            //               .textTheme
            //               .bodyMedium!
            //               .copyWith(color: AppPallets.black),
            //           hexInputBar: true,
            //           labelTypes: const [ColorLabelType.rgb],
            //           onColorChanged: (value) {},
            //         ),
            //       ),
            //     ),
            //   ),
            // );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppPallets.border, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: AppPallets.black,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text("#000000",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppPallets.black)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
