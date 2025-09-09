import 'package:flutter/material.dart';

class AnimatedGradientBorder extends StatefulWidget {
  final double size;
  final double borderWidth;
  final Widget child;

  const AnimatedGradientBorder({
    super.key,
    required this.size,
    required this.child,
    this.borderWidth = 4.0,
  });

  @override
  _AnimatedGradientBorderState createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(); // Loop the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: GradientCirclePainter(
            animationValue: _controller.value,
            borderWidth: widget.borderWidth,
          ),
          child: Container(
            width: widget.size,
            height: widget.size,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(child: widget.child),
          ),
        );
      },
    );
  }
}

class GradientCirclePainter extends CustomPainter {
  final double animationValue;
  final double borderWidth;

  GradientCirclePainter({
    required this.animationValue,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Continuous gradient shader with animation
    final gradient = SweepGradient(
      colors: [
        Color(0xFF080045), // Deep Navy Blue
        Color(0xFF1E0059), // Dark Purple
        Color(0xFF0041A8), // Royal Blue
        Color(0xFF3B00B3), // Electric Indigo
        Color(0xFF6600FF), // Vivid Purple
        Color(0xFF0084FF), // Bright Blue
        Color(
            0xFF080045), // Deep Navy Blue (wraparound for seamless effect)// Ensure seamless looping
      ],
      stops: const [
        0.0,
        0.2,
        0.4,
        0.6,
        0.8,
        0.9,
        1.0, // Full wrap-around for seamless animation
      ],
      transform: GradientRotation(animationValue * 2 * 3.14159),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Draw the circular border
    final radius = size.width / 2 - borderWidth / 2; // Adjust for border width
    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
