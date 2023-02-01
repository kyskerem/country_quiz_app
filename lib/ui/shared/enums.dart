import 'package:flutter/material.dart';

enum EdgeInsetsValues {
  appMargin,
  cardMargin,
  answerTextMargin,
  optionMargin,
  nextCardPadding,
  nextCardMargin,
  questionCardPadding,
}

extension SetEdgeInsetsValues on EdgeInsetsValues {
  EdgeInsetsGeometry edgeInsets() {
    switch (this) {
      case EdgeInsetsValues.cardMargin:
        return const EdgeInsets.symmetric(horizontal: 25, vertical: 5);
      case EdgeInsetsValues.appMargin:
        return const EdgeInsets.symmetric(horizontal: 35);
      case EdgeInsetsValues.answerTextMargin:
        return const EdgeInsets.symmetric(horizontal: 20);
      case EdgeInsetsValues.optionMargin:
        return const EdgeInsets.fromLTRB(30, 0, 30, 15);
      case EdgeInsetsValues.nextCardPadding:
        return const EdgeInsets.all(10.0);
      case EdgeInsetsValues.nextCardMargin:
        return const EdgeInsets.symmetric(vertical: 15);
      case EdgeInsetsValues.questionCardPadding:
        return const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20);
    }
  }
}

enum DurationValues { lowDuration, mediumDuration, longDuration }

extension SetDurationValues on DurationValues {
  Duration duration() {
    switch (this) {
      case DurationValues.lowDuration:
        return const Duration(seconds: 1);
      case DurationValues.mediumDuration:
        return const Duration(milliseconds: 1200);

      case DurationValues.longDuration:
        return const Duration(milliseconds: 1500);
    }
  }
}
