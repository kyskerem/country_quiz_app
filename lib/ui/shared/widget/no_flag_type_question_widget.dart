import 'package:flutter/material.dart';
import 'package:quiz_app/ui/shared/enums.dart';

import '../theme/theme.dart';

class NoFlagQuestionTypeWidget extends StatelessWidget {
  const NoFlagQuestionTypeWidget({
    Key? key,
    required this.capitalCityName,
  }) : super(key: key);

  final String capitalCityName;
  @override
  Widget build(BuildContext context) {
    return _questionText(context);
  }

  Widget _questionText(BuildContext context) {
    final String noFlagQuestionText = '$capitalCityName is the capital of?';
    return Padding(
      padding: EdgeInsetsValues.cardMargin.edgeInsets(),
      child: Text(
        noFlagQuestionText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: LightColors.darkBlueTextColor.color(),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
