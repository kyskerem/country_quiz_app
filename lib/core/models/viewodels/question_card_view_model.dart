import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../ui/shared/widget/quiz_card.dart';
import '../../api_services/api_service.dart';
import '../country_data_model.dart';

abstract class QuizCardViewModel extends State<NewQuizCard> {
  final ApiService _apiService = ApiService();
  final List<CountryData> chosenCountries = [];
  int questionLimit = 40;
  int answeredQuestions = 0;
  int trueAnswers = 0;

  CountryData? askedCountry;
  static CountryData? selectedCountry;

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

  void getNextQuiz() {
    if (isFinished == false) {
      setState(() {
        ListData.countryDataList.remove(askedCountry);
        ListData.countryDataList.shuffle();
        chosenCountries.clear();
        isTrueAnswer() ? trueAnswers += 1 : '';
        answeredQuestions += 1;
        getNewCountryQuiz();
        selectedCountry = null;
      });
    }
  }

  bool isWrongAnswer(CountryData country) =>
      country == selectedCountry && country != askedCountry;

  void changeLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  bool isTrueAnswer() => selectedCountry?.capital == askedCountry?.capital;

  void setSelectedCountry(CountryData country) {
    selectedCountry = country;
  }

  bool get isFinished => answeredQuestions == questionLimit;

  void showTrueAnswer() {}
  @override
  void initState() {
    super.initState();
    getNewCountryQuiz();
  }
}
