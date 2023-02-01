import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../widget/quiz_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isFinished = false;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  _CountryQuizText(),
                  _NewSvgPicture(),
                ],
              ),
              const _QuizCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountryQuizText extends StatelessWidget {
  const _CountryQuizText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Country Quiz',
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewQuizCard();
  }
}

class _NewSvgPicture extends StatelessWidget {
  const _NewSvgPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/undraw-adventure.svg',
      fit: BoxFit.scaleDown,
    );
  }
}
