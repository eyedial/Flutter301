import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // 버튼이 눌렸을때 > ScreenA() 로 이동
              onPressed: (){
                Navigator.pushNamed(context, '/a');
              },
              child: Text('Go to ScreenA'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              // 버튼이 눌렸을때 > ScreenA() 로 이동
              onPressed: (){
                Navigator.pushNamed(context, '/b');
              },
              child: Text('Go to ScreenB'),
            ),
          ],
        ),
      ),
    );
  }
}
