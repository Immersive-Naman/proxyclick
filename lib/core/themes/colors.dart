import 'package:flutter/material.dart';

class AppPallets {
  static const font = Color(0xFF000000);
  static const fontGrey = Color(0xFF545454);
  static const hint = Color(0xFFD9D9D9);
  static const gradient1 = Color(0xFF080045);
  static const gradient2 = Color(0xFF04087A);
  static const border = Color(0xFFD9D9D9);
  static const card_grey = Color(0xFFF0F0F0);
  static const grey2 = Color(0xFFFAFAFA);
  static const icon = Color(0xFF969696);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const focusedBorder = Color(0xFF04087A);
  static const errorBorder = Color(0xFFFF2C2C);

  //Gradients and Shadows
  static const bottonGradient = LinearGradient(
      colors: [gradient1, gradient2],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static const radialGradient1 = RadialGradient(
    colors: [
      gradient2,
      gradient1,
    ],
    center: Alignment.center, // Center of the gradient
    radius: 1, // Radius of the gradient
    focal: Alignment.center, // Focal point for the gradient
    focalRadius: 0.1, // Radius around the focal point
  );
  static const radialGradient2 = RadialGradient(
    colors: [Color(0x50161E31), Color(0xFF161E31)],
    center: Alignment.center, // Center of the gradient
    radius: 1, // Radius of the gradient
    focal: Alignment.center, // Focal point for the gradient
    focalRadius: 0.1, // Radius around the focal point
  );

  static const shadow = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, .2),
      spreadRadius: 0,
      blurRadius: 4,
      offset: Offset(0, 0));
}
