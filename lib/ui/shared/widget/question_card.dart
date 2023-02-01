import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/core/models/country_data_model.dart';
import 'package:flutter_design_app_second/ui/shared/view/question_card_view_model.dart';

import '../enums.dart';
import '../theme/theme.dart';
import 'no_flag_type_question_widget.dart';

class QuestionCard extends QuizCard {
  const QuestionCard({
    super.key,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NoFlagQuestionTypeWidget(
            capitalCityName: widget.askedCountry?.capital ?? '-Api problem-'),
        answerCard(context, option: 'A', country: widget.chosenCountries[0]),
        answerCard(context, option: 'B', country: widget.chosenCountries[1]),
        answerCard(context, option: 'C', country: widget.chosenCountries[2]),
        answerCard(context, option: 'D', country: widget.chosenCountries[3]),
        Visibility(
          visible: widget.isAnswered ? true : false,
          child: _nextButton(context),
        ),
        Text(
          '${widget.answeredQuestions}/${widget.questionLimit}',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: LightColors.orangeCardColor.color()),
        ),
      ],
    );
  }

  Widget answerCard(BuildContext context,
      {required CountryData country, required String option}) {
    late bool isWrongAnswer;
    late bool isCorrectAnswer;
    Color borderColor = LightColors.purpleAccentTextColor.color();

    return Padding(
      padding: EdgeInsetsValues.optionMargin.edgeInsets(),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor),
        ),
        onPressed: widget.isAnswered == false
            ? () {
                setState(
                  () {
                    widget.isAnswered = true;
                    Future.delayed(const Duration(milliseconds: 500));
                    widget.setSelectedCountry(country);
                    widget.isTrueAnswer();
                    isCorrectAnswer =
                        widget.selectedCountry?.name == country.name;
                    isWrongAnswer =
                        widget.selectedCountry?.name != country.name;
                    if (isCorrectAnswer) {
                      borderColor = LightColors.trueAnswerCardColor.color();
                    } else if (isWrongAnswer) {
                      borderColor = LightColors.wrongAnswerCardColor.color();
                    }
                  },
                );
              }
            : null,
        child: Row(
          children: [
            optionText(option, context),
            Expanded(
              child: Padding(
                padding: EdgeInsetsValues.answerTextMargin.edgeInsets(),
                child: countryNameText(country, context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text optionText(String option, BuildContext context) {
    return Text(
      option,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: LightColors.purpleAccentTextColor.color(),
          fontWeight: FontWeight.bold),
    );
  }

  Text countryNameText(CountryData country, BuildContext context) {
    return Text(
      country.name!,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: LightColors.purpleAccentTextColor.color(),
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _nextButton(BuildContext context) {
    String nextText = widget.answeredQuestions == widget.questionLimit - 1
        ? 'Finish'
        : 'Next';
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isAnswered = false;
          widget.getNextQuiz();
        });
      },
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
