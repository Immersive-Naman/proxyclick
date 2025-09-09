import 'package:flutter/widgets.dart';

extension MediaQueryExtension on BuildContext {
  /// Returns the height of the screen
  double get height => MediaQuery.of(this).size.height;

  /// Returns the width of the screen
  double get width => MediaQuery.of(this).size.width;

  /// Returns a percentage of the screen height
  double heightPercent(double percent) => height * (percent / 100);

  /// Returns a percentage of the screen width
  double widthPercent(double percent) => width * (percent / 100);

  /// Returns the padding from the top (includes status bar and safe area)
  double get paddingTop => MediaQuery.of(this).padding.top;

  /// Returns the padding from the bottom (includes safe area)
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  /// Returns the viewInsets bottom (useful for keyboard height)
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;

  /// Returns whether the device is in landscape mode
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Returns whether the device is in portrait mode
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}

class ResponsiveDesign {
  static double mobileWidth = 390;
  static double mobileHeight = 844;
  static double desktopWidth = 633;
  static double desktopHeight = 1133;
  static double breakpoint = 648; // Switch between mobile/desktop views
}

extension ResponsiveSize on BuildContext {
  bool get isMobileView =>
      MediaQuery.of(this).size.width < ResponsiveDesign.breakpoint;

  double _getDesignWidth() => isMobileView
      ? ResponsiveDesign.mobileWidth
      : ResponsiveDesign.desktopWidth;

  double _getDesignHeight() => isMobileView
      ? ResponsiveDesign.mobileHeight
      : ResponsiveDesign.desktopHeight;

  double getWidth(double designWidth) {
    final currentWidth = MediaQuery.of(this).size.width;
    return (designWidth / _getDesignWidth()) * currentWidth;
  }

  double getHeight(double designHeight) {
    final currentHeight = MediaQuery.of(this).size.height;
    return (designHeight / _getDesignHeight()) * currentHeight;
  }

  double getFontSize(double designFontSize) {
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    final baseShortestSide = isMobileView
        ? ResponsiveDesign.mobileWidth
        : ResponsiveDesign.desktopWidth;

    return (designFontSize / baseShortestSide) * shortestSide;
  }
}
