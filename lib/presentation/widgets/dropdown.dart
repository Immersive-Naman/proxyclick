import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:proxyclick/core/themes/colors.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> options; // List of options for the dropdown
  final Function(String) onSelect; // Callback for selected value
  final String selectedValue;
  final String label;
  const CustomDropdownMenu({
    super.key,
    required this.options, // Pass the options dynamically
    required this.selectedValue, // Pass the options dynamically
    required this.onSelect, // Callback for selected value
    required this.label, // Callback for selected value
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? selectedValue; // Tracks the selected value
  @override
  void initState() {
    selectedValue = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border:
                Border.all(color: AppPallets.border, width: 1), // Gray border
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            underline: const SizedBox(), // Removes the default underline
            iconEnabledColor: AppPallets.black,
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedArrowDown01,
              color: Colors.black,
              size: 24.0,
            ), // Dropdown arrow
            dropdownColor: AppPallets.white,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppPallets.black,
                ),
            borderRadius: BorderRadius.circular(12),
            // Text style
            items: widget.options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppPallets.black)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue; // Update selected value
              });
              widget.onSelect(newValue!); // Call the onSelect callback
            },
          ),
        ),
      ],
    );
  }
}
