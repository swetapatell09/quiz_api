import 'package:flutter/material.dart';
import 'package:quiz_api/screen/home/view/home_screen.dart';
import 'package:quiz_api/screen/quiz/view/quiz_screen.dart';
import 'package:quiz_api/screen/result/view/result_screen.dart';
import 'package:quiz_api/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> app_route = {
  "/": (context) => const SplashScreen(),
  "home": (context) => const HomeScreen(),
  "quiz": (context) => const QuizScreen(),
  "result": (context) => const ResultScreen(),
};
