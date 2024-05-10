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
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator - First Page'),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text('Go to the Second Page'),
          onPressed: () {
            // 클릭하면 second Page로 이동한다
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            // 창을 없앨때(종료할때)
            Navigator.pop(context);
          },
          child: Text('Go to the First Page'),
        ),
      ),
    );
  }
}
