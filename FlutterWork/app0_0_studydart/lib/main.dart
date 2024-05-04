import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 견본 : 전체적인 앱의 색상지정
      ),
      home: MyHomePage(),
      //home: CoulmnRow(),

    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 빈 도화지
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ), //클로징 라벨
      body: Center(
        child: Column(
          children: [
            Text('Hello World'),
          ],
        ),
      ),
    );
  }
}


