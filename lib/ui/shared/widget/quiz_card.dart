import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:quiz_app/core/models/country_data_model.dart';
import 'package:quiz_app/ui/shared/enums.dart';
import 'package:quiz_app/ui/shared/widget/flag_question_type_widget.dart';
import 'package:quiz_app/ui/shared/widget/result_card.dart';

import '../../../core/models/viewodels/question_card_view_model.dart';
import '../theme/theme.dart';
import 'no_flag_type_question_widget.dart';

part 'question_card.dart';

class NewQuizCard extends StatefulWidget {
  const NewQuizCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NewQuizCard> createState() => _NewQuizCardState();
}

class _NewQuizCardState extends QuizCardViewModel {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        child: isLoading == false
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsetsValues.questionCardPadding.edgeInsets(),
                    child: isFinished == false
                        ? QuestionCard(
                            setSelectedCountry: setSelectedCountry,
                            askedCountry: askedCountry,
                            chosenCountries: chosenCountries,
                            isAnswered: isAnswered,
                            isTrueAnswer: isTrueAnswer,
                            questionLimit: questionLimit,
                            selectedCountry: selectedCountry,
                            getNextQuiz: getNextQuiz,
                            answeredQuestions: answeredQuestions,
                            isFlagQuestion: math.Random().nextBool(),
                          )
                        : ResultCard(
                            trueAnswers: trueAnswers,
                            questionLimit: questionLimit,
                          ),
                  ),
                ],
              )
            : Padding(
                padding: EdgeInsetsValues.nextCardPadding.edgeInsets(),
                child: CircularProgressIndicator(
                  color: LightColors.orangeCardColor.color(),
                ),
              ),
      )
    ]);
  }
}
