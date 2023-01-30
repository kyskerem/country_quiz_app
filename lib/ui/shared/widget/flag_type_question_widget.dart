import 'package:flutter/material.dart';

import '../theme/theme.dart';

class FlagQuestionTypeWidget extends StatelessWidget {
  const FlagQuestionTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/background.png',
          scale: 35,
        ),
        Text(
          'Which country does this flag belongs to?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: LightColors.darkBlueTextColor.color(),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
