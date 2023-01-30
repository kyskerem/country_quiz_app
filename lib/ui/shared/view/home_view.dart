import 'package:flutter/material.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Country Quiz',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const _NewQuizCard()
            ],
          )),
    );
  }
}

class _NewQuizCard extends StatelessWidget {
  const _NewQuizCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsetsValues.CardMargin.edgeInsets(),
          color: Colors.red,
          child: Column(children: const []),
        ),
      ],
    );
  }
}

enum EdgeInsetsValues { CardMargin }

extension SetEdgeInsetsValues on EdgeInsetsValues {
  EdgeInsetsGeometry edgeInsets() {
    switch (this) {
      case EdgeInsetsValues.CardMargin:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 150);
    }
  }
}
