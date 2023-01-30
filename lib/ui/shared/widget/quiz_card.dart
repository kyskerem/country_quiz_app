import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/core/api_services/api_service.dart';
import 'package:flutter_design_app_second/core/models/country_data_model.dart';

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
  final ListData _countryDataList = ListData();
  final ApiService _apiService = ApiService();

  void getDatas() async {
    await _apiService.getCountryDatas();
  }

  void getNewCountryQuiz() async {
    await _apiService.getCountryDatas();
    List<CountryData> selectedCountries = [];
    for (int i = 0; i < 1; i++) {
      int randomNumber =
          math.Random().nextInt(ListData.countryDataList.length - 4);

      selectedCountries.addAll(
          ListData.countryDataList.getRange(randomNumber, randomNumber + 4));
    }
    print('$selectedCountries selectedCountries');
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
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: NoFlagQuestionTypeWidget(capitalCityName: 'Ankara'),
              ),
              _NewAnswersCard(option: 'A', countryName: 'Turkey'),
              _NewAnswersCard(option: 'B', countryName: 'YAlakloı'),
              _NewAnswersCard(option: 'C', countryName: 'Habeşistan'),
              _NewAnswersCard(option: 'E', countryName: 'AFrika'),
              Visibility(
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
