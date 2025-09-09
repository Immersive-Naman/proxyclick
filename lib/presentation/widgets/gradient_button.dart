// import 'package:flutter/material.dart';
// import 'package:proxyclick/core/themes/colors.dart';

// class GradientButton extends StatefulWidget {
//   final String label;
//   final bool isLoading;
//   final bool enableBorder;
//   final double width;
//   final Future<void> Function() onTap;

//   const GradientButton(
//       {super.key,
//       required this.label,
//       required this.width,
//       required this.onTap,
//       this.enableBorder = false,
//       this.isLoading = false});
//   @override
//   State<GradientButton> createState() => _GradientButtonState();
// }

// class _GradientButtonState extends State<GradientButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   bool _isTapped = false;
//   bool _isRotate = false;

//   @override

//   /// Initializes the [_controller] with the current object as the [TickerProvider] and a duration of 1 second.
//   /// Calls [super.initState] to complete the initialization.
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     super.initState();
//   }

//   @override

//   /// Disposes of the animation controller and calls [super.dispose].
//   /// This is important to avoid memory leaks.
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   /// Starts the animation when the button is tapped.
//   void _startAnimationOnTap() async {
//     if (!widget.isLoading) {
//       await widget.onTap();
//       return;
//     }
//     setState(() {
//       _isTapped = true; // Start the animation
//     });
//     await Future.delayed(const Duration(milliseconds: 300));
//     setState(() {
//       _isRotate = true;
//     });
//     _controller.repeat(); // Start rotation

//     // Simulate a call or action

//     await widget.onTap(); // Replace with your call

//     _controller.stop(); // Stop rotation
//     _controller.reset();

//     // Reset to the initial state after a brief pause
//     await Future.delayed(const Duration(milliseconds: 500));
//     setState(() {
//       _isTapped = false;
//       _isRotate = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(
//         onTap: _startAnimationOnTap,
//         child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               double rotation = _controller.value * 2 * 3.14159;
//               return Transform.rotate(
//                 angle: _isRotate ? rotation : 0,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   width: _isTapped ? 50 : widget.width,
//                   alignment: Alignment.center,
//                   height: 50,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: widget.enableBorder
//                           ? Border.all(color: AppPallets.white, width: 1)
//                           : null,
//                       gradient: _isTapped
//                           ? LinearGradient(
//                               colors: [
//                                   AppPallets.gradient1.withOpacity(.8),
//                                   AppPallets.gradient2.withOpacity(.8)
//                                 ],
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight)
//                           : AppPallets.bottonGradient),
//                   child: AnimatedOpacity(
//                     opacity: _isTapped ? 0 : 1, // Fade text out
//                     duration: const Duration(milliseconds: 300),
//                     child: Text(
//                       widget.label,
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium!
//                           .copyWith(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:proxyclick/core/themes/colors.dart';

class GradientButton extends StatefulWidget {
  final String label;
  final bool isLoading;
  final bool enableBorder;
  final double width;
  final Future<void> Function() onTap;

  const GradientButton({
    super.key,
    required this.label,
    required this.width,
    required this.onTap,
    this.enableBorder = false,
    this.isLoading = false,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isTapped = false;

  /// Handles the tap and triggers the animation and loader display.
  Future<void> _startAnimationOnTap() async {
    if (!widget.isLoading) {
      await widget.onTap();
      return;
    }

    setState(() {
      _isTapped = true; // Start the shrinking animation
    });

    // Simulate async operation
    await widget.onTap();

    // Reset the button state after the operation completes
    setState(() {
      _isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _startAnimationOnTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _isTapped ? 50 : widget.width, // Shrink when tapped
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: widget.enableBorder
                ? Border.all(color: AppPallets.white, width: 1)
                : null,
            gradient: _isTapped
                ? LinearGradient(colors: [
                    AppPallets.gradient1.withOpacity(.8),
                    AppPallets.gradient2.withOpacity(.8)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)
                : AppPallets.bottonGradient,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isTapped
                ? LoadingAnimationWidget.threeArchedCircle(
                    color: AppPallets.white, size: 45)
                : Text(
                    widget.label,
                    key: ValueKey(widget.label),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
