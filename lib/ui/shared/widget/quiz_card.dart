import 'package:flutter/material.dart';

import '../enums.dart';
import '../theme/theme.dart';
import 'flag_type_question_widget.dart';
import 'no_flag_type_question_widget.dart';

class NewQuizCard extends StatelessWidget {
  const NewQuizCard({
    Key? key,
    required this.isFlagQuestion,
  }) : super(key: key);
  final bool isFlagQuestion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: isFlagQuestion
                    ? const FlagQuestionTypeWidget()
                    : const NoFlagQuestionTypeWidget(capitalCityName: 'Ankara'),
              ),
              const _NewAnswersCard(option: 'A', countryName: 'Turkey'),
              const _NewAnswersCard(option: 'B', countryName: 'YAlakloı'),
              const _NewAnswersCard(option: 'C', countryName: 'Habeşistan'),
              const _NewAnswersCard(option: 'E', countryName: 'AFrika'),
              const Visibility(
                  // visible: isAnswered ? true : false,
                  child: _NewNextButton())
            ],
          ),
        ),
      ],
    );
  }
}

class _NewNextButton extends StatelessWidget {
  const _NewNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nextText = 'Next';
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsetsValues.nextCardMargin.edgeInsets(),
        color: LightColors.orangeCardColor.color(),
        child: Padding(
          padding: EdgeInsetsValues.nextCardPadding.edgeInsets(),
          child: Text(
            nextText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: LightColors.cardColor.color()),
          ),
        ),
      ),
    );
  }
}

class _NewAnswersCard extends StatelessWidget {
  const _NewAnswersCard({
    Key? key,
    required this.countryName,
    required this.option,
  }) : super(key: key);
  final String countryName;
  final String option;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsValues.optionMargin.edgeInsets(),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: LightColors.purpleAccentTextColor.color())),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              option,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: LightColors.purpleAccentTextColor.color(),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsetsValues.answerTextMargin.edgeInsets(),
              child: Text(
                countryName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: LightColors.purpleAccentTextColor.color(),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
