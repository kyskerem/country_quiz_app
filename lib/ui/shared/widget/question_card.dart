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

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin {
  late final AnimationController _animController = AnimationController(
      vsync: this, duration: DurationValues.lowDuration.duration());
  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isFlagQuestion
            ? FlagQuestionTypeWidget(
                flagUrl: widget.askedCountry?.flagUrl ?? '-Api Error-')
            : NoFlagQuestionTypeWidget(
                capitalCityName: widget.askedCountry?.capital ?? '-Api Error-'),
        answerCard(
          context,
          option: 'A',
          country: widget.chosenCountries[0],
        ),
        answerCard(
          context,
          option: 'B',
          country: widget.chosenCountries[1],
        ),
        answerCard(
          context,
          option: 'C',
          country: widget.chosenCountries[2],
        ),
        answerCard(
          context,
          option: 'D',
          country: widget.chosenCountries[3],
        ),
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

  Widget answerCard(
    BuildContext context, {
    required CountryData country,
    required String option,
  }) {
    bool isCorrectAnswer = country.name == widget.askedCountry?.name;
    return Padding(
      padding: EdgeInsetsValues.optionMargin.edgeInsets(),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            animationDuration: DurationValues.longDuration.duration(),
            backgroundColor: widget.isAnswered && isCorrectAnswer
                ? LightColors.trueAnswerCardColor.color()
                : LightColors.cardColor.color()),
        onPressed: widget.isAnswered == false
            ? () {
                setState(() {
                  widget.setSelectedCountry(country);
                  widget.isTrueAnswer();

                  widget.isAnswered = true;
                });
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
        setState(
          () {
            widget.isAnswered = false;
            widget.getNextQuiz();
          },
        );
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
