import 'package:flutter/material.dart';

class MyTheme {
  static const LinearGradient redGradient1 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF9B1E20), Color(0xFFC02225), Color(0xFFC03336)],
  );

  static const LinearGradient redGradient1Reversed = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [Color(0xFF9B1E20), Color(0xFFC02225), Color(0xFFC03336)],
  );

  static LinearGradient redGradient2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF9B1E20).withValues(alpha: 0.5),
      Color(0xFFC02225).withValues(alpha: 0.5),
      Color(0xFFC03336).withValues(alpha: 0.5),
    ],
  );

  static LinearGradient redGradient3 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF9B1E20).withValues(alpha: 0.5),
      Color(0xFFC02225).withValues(alpha: 0.5),
      Color(0xFFC03336).withValues(alpha: 0.5),
    ],
  );
}
