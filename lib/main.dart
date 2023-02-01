import 'package:flutter/material.dart';
import 'package:quiz_app/ui/shared/theme/theme.dart';
import 'package:quiz_app/ui/shared/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: LightTheme().theme,
      home: const HomeView(),
    );
  }
}
