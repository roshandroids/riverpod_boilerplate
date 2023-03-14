import 'package:flutter/material.dart';

extension CoreColors on ThemeData {
  Color get coreRed => const Color.fromRGBO(242, 63, 64, 1);
  Color get coreWhite => const Color.fromARGB(255, 255, 255, 255);
  Color get coreTransparent => const Color.fromRGBO(0, 0, 0, 0);
  Color get coreBlack => const Color.fromRGBO(0, 0, 0, 1);
  Color get coreGreen => const Color.fromRGBO(76, 175, 80, 1);
  Color get coreSkyBlue => const Color.fromRGBO(96, 165, 250, 1);
  Color get coreDarkBlue => const Color(0xFF0A2645);
  Color get corePurple => const Color.fromRGBO(165, 180, 251, 1);
}
