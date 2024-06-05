import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'MainPage.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            // 제목
            title: '나의 앱에 방문한것을 환영합니다',
            // 내용
            body: '이 앱은 여행을 가고 싶을때 가고 싶은 여행정보와 알아두면'
                ' 좋은 팁을 적을수 있고 교통편과 그곳의 풍광을 사진을 찍어서 '
                '공유하는 여행정보 커뮤니티입니다',
            // 내용과 맞는 이미지 > 사이즈가 너무 큰 이미지는 로딩하는데 시간도
            // 걸리고 너무 크면 못 가져온다 > 1024 정도가 알맞다
            image: Image.asset('lib/images/page1.jpg'),
            decoration: buildPageDecoration()),
        PageViewModel(
            // 제목
            title: '나의 앱에 방문한것을 환영합니다',
            // 내용
            body: '이 앱은 여행을 가고 싶을때 가고 싶은 여행정보와 알아두면'
                ' 좋은 팁을 적을수 있고 교통편과 그곳의 풍광을 사진을 찍어서 '
                '공유하는 여행정보 커뮤니티입니다',
            // 내용과 맞는 이미지 > 사이즈가 너무 큰 이미지는 로딩하는데 시간도
            // 걸리고 너무 크면 못 가져온다 > 1024 정도가 알맞다
            image: Image.asset('lib/images/page2.jpg'),
            decoration: buildPageDecoration()),
        PageViewModel(
            // 제목
            title: '나의 앱에 방문한것을 환영합니다',
            // 내용
            body: '이 앱은 여행을 가고 싶을때 가고 싶은 여행정보와 알아두면'
                ' 좋은 팁을 적을수 있고 교통편과 그곳의 풍광을 사진을 찍어서 '
                '공유하는 여행정보 커뮤니티입니다',
            // 내용과 맞는 이미지 > 사이즈가 너무 큰 이미지는 로딩하는데 시간도
            // 걸리고 너무 크면 못 가져온다 > 1024 정도가 알맞다
            image: Image.asset('lib/images/page3.jpg'),
            decoration: buildPageDecoration()),
      ],
      // 스크린의 마지막까지 보았을때 누르는 곳
      done: Text('done'),
      // done를 눌렀을때 수행하는 것을 구현해 놓는 곳
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      },
      showSkipButton: true,
      skip: Text('건너뛰기'),
      // 아래쪽의 점들과 선택한 점들 변화시키기
      dotsDecorator: DotsDecorator(
          color: Colors.blue,
          activeColor: Colors.red,
          // 전체적인 점 크기
          size: Size(10, 10),
          // 선택된 점은 길게 차지
          activeSize: Size(22, 10),
          // 선택된 점의 모양
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          )),
      // 여러스트린이 있을때 다음 페이지로 넘어가는 역할 > 글자, 아이콘
      next: Icon(Icons.arrow_forward),
      // 화면 애니메이션
      curve: Curves.bounceInOut,
    );
  }

  PageDecoration buildPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle:
          TextStyle(fontSize: 30, color: Colors.black45, fontFamily: 'Dokdo'),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Colors.orange,
    );
  }
}
