import 'package:flutter/material.dart';

import '../theme/theme.dart';

class NoFlagQuestionTypeWidget extends StatelessWidget {
  const NoFlagQuestionTypeWidget({
    Key? key,
    required this.capitalCityName,
  }) : super(key: key);

  final String capitalCityName;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$capitalCityName is the capital of?',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: LightColors.darkBlueTextColor.color(),
          fontWeight: FontWeight.bold),
    );
  }
}
