import '/screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'Message.dart';
import 'Noti.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index){
            // 선택된 메뉴로 이동시키기 위해 선택된 인덱스를 State에게 알려줘야 한다
            setState(() {
              currentPageIndex = index;
            });
          },
          // 선택되었을 때 바탕색
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          // 원하는 갯수의 메뉴를 넣는다
          destinations: [
            NavigationDestination(
              // 선택되었을때 아이콘
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            NavigationDestination(
              icon:Badge(
                child: Icon(Icons.notifications_sharp),
              ),
              label: '알림',
            ),
            NavigationDestination(
              icon:Badge(
                child: Icon(Icons.message_sharp),
                label: Text('2'),
              ),
              label: '대화방',
            ),
          ],
        ),
        body: [
          HomePage(),
          Noti(),
          Message(),
        ][currentPageIndex],
      ),
    );
  }
}
