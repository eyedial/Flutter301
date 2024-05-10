import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    logger.d('프로그램 시작');

    return const MaterialApp(
      // 애뮬레이터 상단에 디버그 끈을 없애고 싶다
      debugShowCheckedModeBanner: false,
      title: 'MY CARD',
      home: MyCardPage(),
    );
  }
}

class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text('MY CARD'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          // 죄우 정렬시 사용
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지를 넣기 위해서는 경로를 pubspec.yaml 에 설정해주어야 한다
            // 이미지를 가운데로 : CircleAvatar를 클릭해서 노란전구 클릭 -> wrap
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/binggo_after.gif'),
                // 이미지 크기를 조절
                radius: 60.0,
              ),
            ),

            // 줄 긋기
            Divider(
              height: 80,
              thickness: 1,
              color: Colors.grey,
            ),
            // name 글자
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'BINGGO',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'BINGGO POWER LEVEL',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '14',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '얼음번개',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '눈에 얼음의 정수 넣기',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '눈 내릴때 얼음칼 만들기',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/binggobefore.png'),
                radius: 40,
              ),
            )

          ],
        ),
      ),
    );
  }
}
