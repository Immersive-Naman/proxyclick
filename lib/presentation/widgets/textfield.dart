import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/themes/colors.dart';
import 'package:proxyclick/presentation/widgets/icons.dart';

import '../../core/utils/app_icons.dart';

class AppTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool capitalize;
  final bool isPassField;
  final bool filled;
  final TextEditingController ctrl;
  final void Function(String)? onChanged;
  final Color labelColor;
  const AppTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.labelText,
    required this.ctrl,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.capitalize = true,
    this.isPassField = false,
    this.labelColor = Colors.black,
    this.filled = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: widget.labelColor),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.ctrl,
          onChanged: widget.onChanged,

          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.isPassField ? !isPasswordVisible : false,
          focusNode: _focusNode, // Attach the FocusNode
          validator: widget.validator,
          cursorHeight: 20,
          textCapitalization: widget.capitalize
              ? TextCapitalization.words
              : TextCapitalization.none,
          style: GoogleFonts.dmSans(fontSize: 16, color: AppPallets.font),
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: widget.filled,
            fillColor: AppPallets.white,
            prefixIcon: HugeIcon(
              icon: widget.prefixIcon,
              size: 24,
              color: _isFocused ? AppPallets.gradient2 : AppPallets.icon,
            ),
            suffixIcon: widget.isPassField
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: MyIcon(
                      color: _isFocused
                          ? AppPallets.gradient2
                          : AppPallets.icon,
                      icon: isPasswordVisible
                          ? AppIcons.pass_visible
                          : AppIcons.pass_invisible,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
