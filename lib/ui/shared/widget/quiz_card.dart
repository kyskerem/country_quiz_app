import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/core/api_services/api_service.dart';
import 'package:flutter_design_app_second/core/models/country_data_model.dart';
import 'package:flutter_design_app_second/ui/shared/enums.dart';
import 'package:flutter_design_app_second/ui/shared/widget/question_card.dart';
import 'package:flutter_design_app_second/ui/shared/widget/result_card.dart';

class NewQuizCard extends StatefulWidget {
  const NewQuizCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NewQuizCard> createState() => _NewQuizCardState();
}

class _NewQuizCardState extends State<NewQuizCard> {
  final ApiService _apiService = ApiService();

  final List<CountryData> chosenCountries = [];
  int questionLimit = 3;
  int answeredQuestions = 0;
  int trueAnswers = 0;

  CountryData? askedCountry;
  CountryData? selectedCountry;

  bool isLoading = true;
  bool isAnswered = false;
  bool isFirstQuestion = true;

  Future<void> getNewCountryQuiz() async {
    if (isFirstQuestion == true) {
      await _apiService.getCountryDatas();
      isFirstQuestion = false;
      changeLoadingState();
    }

    for (int i = 0; i < 1; i++) {
      int randomNumber =
          math.Random().nextInt(ListData.countryDataList.length - 4);

      chosenCountries.addAll(
          ListData.countryDataList.getRange(randomNumber, randomNumber + 4));
    }

    askedCountry = chosenCountries.elementAt(math.Random().nextInt(4));
  }

  void changeLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void getNextQuiz() {
    if (isFinished == false) {
      setState(() {
        ListData.countryDataList.remove(askedCountry);
        chosenCountries.clear();
        isTrueAnswer() ? trueAnswers += 1 : '';
        answeredQuestions += 1;
        getNewCountryQuiz();
        selectedCountry = null;
      });
    }
  }

  bool isTrueAnswer() {
    return selectedCountry?.capital == askedCountry?.capital;
  }

  void setSelectedCountry(CountryData country) {
    selectedCountry = country;
  }

  bool get isFinished {
    return answeredQuestions == questionLimit;
  }

  void showTrueAnswer() {}
  @override
  void initState() {
    super.initState();
    getNewCountryQuiz();
  }

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
