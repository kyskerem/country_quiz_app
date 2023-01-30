import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/ui/shared/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../widget/quiz_card.dart';

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
              children: const [
                _CountryQuizText(),
                _QuizCard(),
                _NewSvgPicture(),
              ],
            ),
          )),
    );
  }
}

class _CountryQuizText extends StatelessWidget {
  const _CountryQuizText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      top: 235,
      left: 10,
      right: 0,
      child: Text(
        'Country Quiz',
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 280,
      left: 0,
      right: 0,
      bottom: 0,
      child: NewQuizCard(
        isFlagQuestion: false,
      ),
    );
  }
}

class _NewSvgPicture extends StatelessWidget {
  const _NewSvgPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 385,
      right: 0,
      top: 0,
      left: 170,
      child: SvgPicture.asset(
        'assets/svgs/undraw-adventure.svg',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class NewNextButton extends StatelessWidget {
  const NewNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nextText = 'Next';
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsetsValues.NextCardMargin.edgeInsets(),
        color: LightColors.orangeCardColor.color(),
        child: Padding(
          padding: EdgeInsetsValues.NextCardPadding.edgeInsets(),
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
