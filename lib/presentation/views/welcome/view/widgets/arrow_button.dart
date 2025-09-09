import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';

class ArrowButton extends StatefulWidget {
  final String title;
  final Function() onTap;

  const ArrowButton({super.key, required this.title, required this.onTap});

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController actrl;
  late Animation<double> shakeAnimation;
  late var welcome;
  @override
  void initState() {
    actrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    shakeAnimation = Tween<double>(
      begin: -5.0,
      end: 5.0,
    ).animate(CurvedAnimation(parent: actrl, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    actrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(width: 32),
            AnimatedBuilder(
              animation: actrl,
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(shakeAnimation.value, 0),
                  child: SvgPicture.asset(AppAssets.arrows),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
