import 'package:flutter/material.dart';
import 'package:flutter_design_app_second/ui/shared/enums.dart';
import 'package:flutter_design_app_second/ui/shared/theme/theme.dart';
import 'package:flutter_design_app_second/ui/shared/view/home_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultCard extends StatelessWidget {
  ResultCard({super.key, required this.trueAnswers});

  int trueAnswers;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => HomeView(
                            isFinished: true,
                          )),
                );
              },
              child: const Text('TRY AGAIN')),
        ),
      ],
    );
  }

  Text finishText(BuildContext context) {
    return Text.rich(
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
          const TextSpan(text: 'correct answers.')
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
