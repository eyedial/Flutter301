import 'package:flutter/material.dart';

import 'screens/OnBoardingPage.dart';

void main() {
  runApp(const MyApp());
}

// onborading page를 위한 외부 패키지(라이브러리)사용
// pub.dev > introducation_screen > install , example
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardingPage(),
    );
  }
}

