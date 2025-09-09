import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proxyclick/core/themes/colors.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallets.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppPallets.gradient2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.dmSans(
        fontSize: 16,
        color: AppPallets.hint,
      ),
      errorStyle: GoogleFonts.dmSans(
        fontSize: 14,
        color: AppPallets.errorBorder,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.focusedBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.errorBorder),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.errorBorder),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  );
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallets.white,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        }),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppPallets.gradient2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.dmSans(
        fontSize: 16,
        color: AppPallets.hint,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.focusedBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppPallets.errorBorder),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: AppPallets.black,
      ),
      titleMedium: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppPallets.black,
      ),
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppPallets.black,
      ),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppPallets.black,
      ),
    ),
  );
}
