import 'package:flutter/material.dart';

class CustomColor {
  CustomColor._();

  // #d94d41
  // static const Color midosujiLineColor = Color.fromARGB(255, 217, 78, 65);

  static const MaterialColor midosujiLineColor =
      MaterialColor(_midosujiLineColor, <int, Color>{
    50: Color(0xFFFAEAE8),
    100: Color(0xFFF4CAC6),
    200: Color(0xFFECA6A0),
    300: Color(0xFFE4827A),
    400: Color(0xFFDF685E),
    500: Color(_midosujiLineColor),
    600: Color(0xFFD5463B),
    700: Color(0xFFCF3D32),
    800: Color(0xFFCA342A),
    900: Color(0xFFC0251C),
  });
  static const int _midosujiLineColor = 0xFFD94D41;
}
