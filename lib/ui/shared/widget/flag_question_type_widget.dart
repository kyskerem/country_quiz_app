import 'package:flutter/material.dart';
import 'package:quiz_app/ui/shared/enums.dart';
import 'package:quiz_app/ui/shared/theme/theme.dart';

class FlagQuestionTypeWidget extends StatelessWidget {
  const FlagQuestionTypeWidget({Key? key, required this.flagUrl})
      : super(key: key);

  final String flagUrl;
  @override
  Widget build(BuildContext context) {
    const double flagHeight = 50;
    return AnimatedContainer(
      duration: DurationValues.mediumDuration.duration(),
      child: Column(
        children: [
          Card(
            child: Image.network(
              flagUrl,
              alignment: Alignment.topLeft,
              fit: BoxFit.fill,
              height: flagHeight,
            ),
          ),
          Padding(
            padding: EdgeInsetsValues.cardMargin.edgeInsets(),
            child: _questionText(context),
          ),
        ],
      ),
    );
  }

  Widget _questionText(BuildContext context) {
    const String flagQuestionText = 'Which country does this flag belong to?';
    return Padding(
      padding: EdgeInsetsValues.cardMargin.edgeInsets(),
      child: Text(
        flagQuestionText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: LightColors.darkBlueTextColor.color(),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
