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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCardPage(),
    );
  }
}

class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY CARD'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}

