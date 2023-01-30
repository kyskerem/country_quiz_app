import 'package:flutter/material.dart';

class LightTheme {
  final _lightColors = _LightColors();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      //Font
      fontFamily: 'Poppins',
      //Card
      cardTheme: CardTheme(
        color: _lightColors.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

class _LightColors {
  final Color cardColor = const Color.fromARGB(100, 255, 255, 255);
  final Color darkBlueTextColor = const Color.fromARGB(100, 47, 82, 123);
  final Color purpleAccentTextColor = const Color.fromARGB(80, 96, 102, 208);
  final Color wrongAnswerCardColor = const Color.fromARGB(100, 234, 130, 130);
  final Color trueAnswerCardColor = const Color.fromARGB(100, 96, 191, 136);
  final Color orangeCardColor = const Color.fromARGB(100, 249, 168, 38);
}
