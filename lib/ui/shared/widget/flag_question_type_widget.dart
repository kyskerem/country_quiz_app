import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/ui/shared/enums.dart';
import 'package:quiz_app/ui/shared/theme/theme.dart';

class FlagQuestionTypeWidget extends StatelessWidget {
  const FlagQuestionTypeWidget({Key? key, required this.flagUrl})
      : super(key: key);

  final String flagUrl;
  @override
  Widget build(BuildContext context) {
    const double flagHeight = 120;
    return Column(
      children: [
        Card(
          child: SvgPicture.network(
            flagUrl,
            alignment: Alignment.center,
            fit: BoxFit.fill,
            height: flagHeight,
            excludeFromSemantics: true,
            theme: const SvgTheme(fontSize: 14, xHeight: 7),
          ),
        ),
        Padding(
          padding: EdgeInsetsValues.cardMargin.edgeInsets(),
          child: _questionText(context),
        ),
      ],
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
