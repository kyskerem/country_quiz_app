import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/core/models/country_data_model.dart';
import 'package:flutter_design_app_second/ui/shared/enums.dart';
import 'package:flutter_design_app_second/ui/shared/widget/flag_question_type_widget.dart';
import 'package:flutter_design_app_second/ui/shared/widget/result_card.dart';

import '../theme/theme.dart';
import '../view/question_card_view_model.dart';
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
      isLoading == false
          ? Card(
              child: Column(
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
                            isFlagQuestion: true,
                          )
                        : ResultCard(trueAnswers: trueAnswers),
                  ),
                ],
              ),
            )
          : const CircularProgressIndicator()
    ]);
  }
}
