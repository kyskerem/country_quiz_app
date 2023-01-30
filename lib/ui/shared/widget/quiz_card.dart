import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/core/api_services/api_service.dart';
import 'package:flutter_design_app_second/core/models/country_data_model.dart';
import 'package:flutter_design_app_second/ui/shared/view/home_view.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../theme/theme.dart';
import 'no_flag_type_question_widget.dart';

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
  final int questionLimit = 3;
  int answeredQuestions = 0;
  int trueAnswers = 0;

  late CountryData askedCountry;
  CountryData? selectedCountry;

  final bool isLoading = true;

  bool isAnswered = false;

  bool isFirstQuestion = true;

  void getDatas() async {
    await _apiService.getCountryDatas();
  }

  Future<void> getNewCountryQuiz() async {
    if (isFirstQuestion == true) {
      await _apiService.getCountryDatas();
      isFirstQuestion = false;
    }

    for (int i = 0; i < 1; i++) {
      int randomNumber =
          math.Random().nextInt(ListData.countryDataList.length - 4);

      chosenCountries.addAll(
          ListData.countryDataList.getRange(randomNumber, randomNumber + 4));
    }

    askedCountry = chosenCountries.elementAt(math.Random().nextInt(4));

    changeState(isLoading);
  }

  void changeState(bool isLoading) {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void getNextQuiz() {
    if (isFinished == false) {
      ListData.countryDataList.remove(askedCountry);
      chosenCountries.clear();
      isTrueAnswer ? trueAnswers += 1 : '';
      getNewCountryQuiz();
    }
  }

  bool get isFinished {
    return answeredQuestions == questionLimit;
  }

  bool get isTrueAnswer {
    return selectedCountry!.capital == askedCountry.capital;
  }

  @override
  void initState() {
    super.initState();
    getNewCountryQuiz();
  }

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
                child: Column(
                  children: isFinished == false
                      ? questionCard(context)
                      : finishedCard(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> questionCard(BuildContext context) {
    return [
      NoFlagQuestionTypeWidget(capitalCityName: askedCountry.capital!),
      _answerCard(context, option: 'A', country: chosenCountries[0]),
      _answerCard(context, option: 'B', country: chosenCountries[1]),
      _answerCard(context, option: 'C', country: chosenCountries[2]),
      _answerCard(context, option: 'D', country: chosenCountries[3]),
      Visibility(
        visible: isAnswered ? true : false,
        child: _nextButton(context),
      ),
    ];
  }

  List<Widget> finishedCard(BuildContext context) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsetsValues.cardMargin.edgeInsets(),
              child: SvgPicture.asset('assets/svgs/undraw-winners.svg')),
          Padding(
            padding: EdgeInsetsValues.nextCardPadding.edgeInsets(),
            child: Text(
              'Results',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: LightColors.darkBlueTextColor.color()),
            ),
          ),
          Padding(
            padding: EdgeInsetsValues.nextCardPadding.edgeInsets(),
            child: Text(
              'You got $trueAnswers correct answers.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: LightColors.darkBlueTextColor.color()),
            ),
          ),
          Padding(
            padding: EdgeInsetsValues.nextCardMargin.edgeInsets(),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                },
                child: const Text('TRY AGAIN')),
          ),
        ],
      ),
    ];
  }

  Widget _nextButton(
    BuildContext context,
  ) {
    String nextText = 'Next';
    return GestureDetector(
      onTap: () {
        setState(() {
          isAnswered = false;
          getNextQuiz();
          selectedCountry = null;
          answeredQuestions += 1;
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

  Widget _answerCard(BuildContext context,
      {required CountryData country, required String option}) {
    return Padding(
      padding: EdgeInsetsValues.optionMargin.edgeInsets(),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: LightColors.purpleAccentTextColor.color())),
        onPressed: isAnswered == false
            ? () {
                setState(
                  () {
                    isAnswered = true;
                    selectedCountry = country;
                    isTrueAnswer;
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
}
