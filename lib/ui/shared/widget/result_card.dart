import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/ui/shared/enums.dart';
import 'package:quiz_app/ui/shared/theme/theme.dart';
import 'package:quiz_app/ui/shared/view/home_view.dart';

class ResultCard extends StatelessWidget {
  ResultCard(
      {super.key, required this.trueAnswers, required this.questionLimit});

  int trueAnswers;
  int questionLimit;

  @override
  Widget build(BuildContext context) {
    void restart() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeView()));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsetsValues.cardMargin.edgeInsets(),
            child: SvgPicture.asset('assets/svgs/undraw-winners.svg')),
        Padding(
          padding: EdgeInsetsValues.nextCardPadding.edgeInsets(),
          child: resultsText(context),
        ),
        Padding(
          padding: EdgeInsetsValues.nextCardPadding.edgeInsets(),
          child: finishText(context),
        ),
        Padding(
          padding: EdgeInsetsValues.nextCardMargin.edgeInsets(),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: LightColors.cardColor.color(),
                  backgroundColor: LightColors.orangeCardColor.color()),
              onPressed: restart,
              child: const Text('TRY AGAIN')),
        ),
      ],
    );
  }

  Text finishText(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'You got ',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: LightColors.darkBlueTextColor.color(),
            ),
        children: [
          TextSpan(
              text: '$trueAnswers ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: LightColors.trueAnswerCardColor.color())),
          const TextSpan(text: 'correct answers.'),
          TextSpan(
              text: ' ${questionLimit - trueAnswers} ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: LightColors.wrongAnswerCardColor.color())),
          const TextSpan(
            text: 'wrong Answers',
          )
        ],
      ),
    );
  }

  Text resultsText(BuildContext context) {
    return Text(
      'Results',
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: LightColors.darkBlueTextColor.color()),
    );
  }
}
