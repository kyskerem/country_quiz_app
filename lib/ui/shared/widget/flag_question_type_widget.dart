import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/ui/shared/enums.dart';
import 'package:flutter_design_app_second/ui/shared/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlagQuestionTypeWidget extends StatelessWidget {
  const FlagQuestionTypeWidget({Key? key, required this.flagUrl})
      : super(key: key);

  final String flagUrl;
  @override
  Widget build(BuildContext context) {
    const double flagHeight = 180;
    return Column(
      children: [
        SvgPicture.network(
          flagUrl,
          alignment: Alignment.center,
          fit: BoxFit.cover,
          height: flagHeight,
        ),
        Padding(
          padding: EdgeInsetsValues.cardMargin.edgeInsets(),
          child: _questionText(context),
        ),
      ],
    );
  }

  Text _questionText(BuildContext context) {
    const String flagQuestionText = 'Which country does this flag belong to?';
    return Text(
      flagQuestionText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: LightColors.darkBlueTextColor.color(),
          fontWeight: FontWeight.bold),
    );
  }
}
