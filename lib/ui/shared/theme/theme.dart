import 'package:flutter/material.dart';

class LightTheme {
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      //Font
      fontFamily: 'Poppins',
      //Card
      cardTheme: CardTheme(
        color: LightColors.cardColor.color(),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

enum LightColors {
  cardColor,
  darkBlueTextColor,
  purpleAccentTextColor,
  wrongAnswerCardColor,
  trueAnswerCardColor,
  orangeCardColor
}

extension SetLightColors on LightColors {
  Color color() {
    switch (this) {
      case LightColors.cardColor:
        return const Color.fromARGB(255, 253, 253, 253);
      case LightColors.darkBlueTextColor:
        return const Color.fromARGB(255, 47, 82, 123);
      case LightColors.purpleAccentTextColor:
        return const Color.fromARGB(164, 96, 102, 208);
      case LightColors.wrongAnswerCardColor:
        return const Color.fromARGB(255, 234, 130, 130);
      case LightColors.trueAnswerCardColor:
        return const Color.fromARGB(255, 96, 191, 136);
      case LightColors.orangeCardColor:
        return const Color.fromARGB(255, 249, 168, 38);
    }
  }
}
