import 'package:flutter/material.dart';

class ThemeDataColors {
  static TextStyle googleAbl({double? fontsize, Color? colors}) {
    return TextStyle(
      color: colors ?? Colors.orange,
      fontSize: fontsize ?? 28,
      fontWeight: FontWeight.w700,
      fontFamily: 'AbhayaLibre', // If you have a custom font asset
    );
  }

  static TextStyle buttuns({double? fontsize, Color? colors}) {
    return TextStyle(
      color: colors ?? Colors.white,
      fontSize: fontsize ?? 28,
      fontWeight: FontWeight.w700,
      fontFamily: 'AbhayaLibre', // If you have a custom font asset
    );
  }

  static TextStyle gbowlbyone({double? fontsize, Color? colors}) {
    return TextStyle(
      letterSpacing: 2,
      color: colors ?? Colors.white,
      fontSize: fontsize ?? 22,
      fontWeight: FontWeight.w500,
      fontFamily: 'BowlbyOne', // If you have a custom font asset
    );
  }

  static TextStyle normalText({double? fontsize, Color? colors}) {
    return TextStyle(
      color: colors ?? Colors.grey,
      fontSize: fontsize ?? 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle roboto({double? fontsize, Color? colors}) {
    return TextStyle(
      letterSpacing: 2,
      color: colors ?? Colors.grey,
      fontSize: fontsize ?? 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto', // If you have a custom font asset or built-in Roboto
    );
  }
}
