import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/ui/shared/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsetsValues.appMargin.edgeInsets(),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 235,
                  left: 10,
                  right: 0,
                  child: Text(
                    'Country Quiz',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Positioned(
                    top: 280,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: _NewQuizCard(
                      isFlagQuestion: false,
                    )),
                Positioned(
                    bottom: 385,
                    right: 0,
                    top: 0,
                    left: 170,
                    child: SvgPicture.asset(
                      'assets/svgs/undraw-adventure.svg',
                      fit: BoxFit.scaleDown,
                    )),
              ],
            ),
          )),
    );
  }
}

class _NewQuizCard extends StatelessWidget {
  const _NewQuizCard({Key? key, required this.isFlagQuestion})
      : super(key: key);
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
              const NewAnswersCard(option: 'A', countryName: 'Turkey'),
              const NewAnswersCard(option: 'B', countryName: 'YAlakloı'),
              const NewAnswersCard(option: 'C', countryName: 'Habeşistan'),
              const NewAnswersCard(option: 'E', countryName: 'AFrika'),
            ],
          ),
        ),
      ],
    );
  }
}

class NoFlagQuestionTypeWidget extends StatelessWidget {
  const NoFlagQuestionTypeWidget({
    Key? key,
    required this.capitalCityName,
  }) : super(key: key);

  final String capitalCityName;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$capitalCityName is the capital of?',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: LightColors.darkBlueTextColor.color(),
          fontWeight: FontWeight.bold),
    );
  }
}

class FlagQuestionTypeWidget extends StatelessWidget {
  const FlagQuestionTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/background.png',
          scale: 35,
        ),
        Text(
          'Which country does this flag belongs to?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: LightColors.darkBlueTextColor.color(),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class NewAnswersCard extends StatelessWidget {
  const NewAnswersCard({
    Key? key,
    required this.countryName,
    required this.option,
  }) : super(key: key);
  final String countryName;
  final String option;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsValues.OptionMargin.edgeInsets(),
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
              padding: EdgeInsetsValues.AnswerTextMargin.edgeInsets(),
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

extension SetEdgeInsetsValues on EdgeInsetsValues {
  EdgeInsetsGeometry edgeInsets() {
    switch (this) {
      case EdgeInsetsValues.cardMargin:
        return const EdgeInsets.symmetric(horizontal: 25, vertical: 5);
      case EdgeInsetsValues.appMargin:
        return const EdgeInsets.symmetric(horizontal: 35);
      case EdgeInsetsValues.AnswerTextMargin:
        return const EdgeInsets.symmetric(horizontal: 40);
      case EdgeInsetsValues.OptionMargin:
        return const EdgeInsets.fromLTRB(30, 0, 30, 15);
    }
  }
}

enum EdgeInsetsValues { appMargin, cardMargin, AnswerTextMargin, OptionMargin }
