import 'package:flutter/material.dart';

import 'ScreenA.dart';
import 'ScreenB.dart';
import 'ScreenC.dart';
import 'ScreenD.dart';
import 'ScreenE.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget screenName = ScreenA();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MyDrawer'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        // 간단한 아이콘이나 위젯을 앱바 타이틀 왼쪽에 위치시키는 것
        /*leading: IconButton(
          onPressed: (){
            print('메뉴버튼이 눌렸습니다');
          },
          icon: Icon(Icons.menu),
        ),*/

        // 앱바 오른쪽 공간에 들어갈 메뉴 리스트
        // 아이콘 버튼이나 팝업메뉴 버튼이 들어갈 수 있다
        actions: [
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 5,),
                          Text('Shopping'),
                        ],
                      ),
                    onTap: (){
                        print('쇼핑메뉴를 클릭하였습니다');
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 5,),
                        Text('Search'),
                      ],
                    ),
                    onTap: (){
                      print('검색메뉴를 클릭하였습니다');
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 5,),
                        Text('Exit'),
                      ],
                    ),
                    onTap: (){
                      print('종료메뉴를 클릭하였습니다');
                    },
                  ),
                ];
              }
          )
          
          /*IconButton(
            onPressed: (){
              print('쇼핑메뉴가 눌렸습니다');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: (){
              print('검색메뉴가 눌렸습니다');
            },
            icon: Icon(Icons.search),
          ),*/
        ],

      ),
      // drawer 메뉴를 만들면 자동으로 햄버거 버튼이 생긴다
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              // 드로어 모양과 색깔 지정
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              ),
              currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage('lib/images/sinabro.png'),
                // url에 있는 이미지 = 서버에 있는 이미지
                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2024/05/15/01/02/cat-8762401_1280.png'),
                // 애니메이션 GIF 이미지
                //backgroundImage: NetworkImage('움짤이 있는 url'),
              ),
              // 다른 사용자 프로필을 우측 상단에 표시할수 있다: 여러개 가능
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/sinabro.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/sinabro2.png'),
                ),
              ],
              accountName: Text('시나브로'),
              accountEmail: Text('aaa@naver.com'),
              // 원한다면 오른쪽 아래에 디테일정보를 나타낼수도 있음
              onDetailsPressed: (){
                print('detail button is clicked');
              },
            ),

            // 헤더 아래 메뉴 => leading: 왼쪽에 아이콘 추가,
            // trailing: 오른쪽에 아이콘 추가
            buildListTile(context, Icons.home, '홈', ScreenA() ),
            buildListTile(context, Icons.shopping_cart_checkout, '쇼핑', ScreenB() ),
            buildListTile(context, Icons.mark_as_unread_sharp, '편지함', ScreenC() ),
            buildListTile(context, Icons.restore_from_trash, '휴지통', ScreenD() ),
            buildListTile(context, Icons.settings, '설정', ScreenE() ),
          ],
        ),
      ),

      body: screenName,

    );
  }

  ListTile buildListTile(
      BuildContext context,
      IconData iconData,
      String title,
      Widget screenName) {
    return ListTile(
            onTap: (){
              print('$title이 클릭됨!!!');
              Navigator.pop(context);
              setState(() {
                this.screenName = screenName;
              });
            },
            leading: Icon(iconData),
            iconColor: Colors.blue,
            focusColor: Colors.amberAccent,
            textColor: Colors.black,
            title: Text(title),
            trailing: Icon(Icons.navigate_next),
          );
  }
}
