part of 'quiz_card.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({
    super.key,
    required this.askedCountry,
    required this.chosenCountries,
    required this.isAnswered,
    required this.questionLimit,
    required this.selectedCountry,
    required this.isTrueAnswer,
    required this.getNextQuiz,
    required this.answeredQuestions,
    required this.setSelectedCountry,
    required this.isFlagQuestion,
    required this.isWrongAnswer,
  });

  CountryData? askedCountry;
  List<CountryData> chosenCountries;
  bool isAnswered;
  int questionLimit;
  int answeredQuestions;
  Function(CountryData) setSelectedCountry;
  CountryData? selectedCountry;
  bool Function() isTrueAnswer;
  void Function() getNextQuiz;
  bool isFlagQuestion;
  bool Function(CountryData country) isWrongAnswer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isFlagQuestion
            ? FlagQuestionTypeWidget(
                flagUrl: widget.askedCountry?.flagUrl ?? '-Api Error-')
            : NoFlagQuestionTypeWidget(
                capitalCityName: widget.askedCountry?.capital ?? '-Api Error-'),
        _answerCard(
          context,
          option: 'A',
          country: widget.chosenCountries[0],
        ),
        _answerCard(
          context,
          option: 'B',
          country: widget.chosenCountries[1],
        ),
        _answerCard(
          context,
          option: 'C',
          country: widget.chosenCountries[2],
        ),
        _answerCard(
          context,
          option: 'D',
          country: widget.chosenCountries[3],
        ),
        AnimatedCrossFade(
          duration: DurationValues.mediumDuration.duration(),
          crossFadeState: CrossFadeState.showSecond,
          firstChild: const SizedBox(),
          secondChild: Visibility(
              visible: widget.isAnswered, child: _nextButton(context)),
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

  Widget _answerCard(
    BuildContext context, {
    required CountryData country,
    required String option,
  }) {
    bool isCorrectAnswer = country.name == widget.askedCountry?.name;

    void chooseOption() {
      setState(() {
        widget.setSelectedCountry(country);

        widget.isTrueAnswer();

        widget.isAnswered = true;
      });
    }

    return Padding(
      padding: EdgeInsetsValues.optionMargin.edgeInsets(),
      child: InkWell(
        onTap: !widget.isAnswered ? chooseOption : null,
        child: AnimatedContainer(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: widget.isAnswered && isCorrectAnswer
                  ? LightColors.trueAnswerCardColor.color()
                  : widget.isAnswered && widget.isWrongAnswer(country)
                      ? LightColors.wrongAnswerCardColor.color()
                      : LightColors.cardColor.color(),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(3, 5))
              ]),
          duration: DurationValues.lowDuration.duration(),
          curve: Curves.bounceInOut,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsetsValues.answerTextMargin.edgeInsets(),
                child: _optionText(option, context),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsValues.answerTextMargin.edgeInsets(),
                  child: _countryNameText(country, context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _optionText(String option, BuildContext context) {
    return Text(
      option,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: LightColors.purpleAccentTextColor.color(),
          fontWeight: FontWeight.bold),
    );
  }

  Text _countryNameText(CountryData country, BuildContext context) {
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
    void toNextQuestion() {
      setState(() {
        widget.isAnswered = false;
        widget.getNextQuiz();
      });
    }

    return GestureDetector(
      onTap: toNextQuestion,
      child: AnimatedContainer(
        duration: DurationValues.mediumDuration.duration(),
        decoration: BoxDecoration(
          color: LightColors.orangeCardColor.color(),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(1, 2),
            )
          ],
        ),
        margin: EdgeInsetsValues.nextCardMargin.edgeInsets(),
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
