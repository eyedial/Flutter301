import 'package:app13_splash_jangter/common/CommonUtil.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    print(CommonUtil.loginUser!.user_profile);

    return Scaffold(
      body: Card(
        //shadowColor: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 프로필 이미지를 등록했다면 그 이미지를 보이고 아니면 디폴트 이미지
              CircleAvatar(
                backgroundImage:
                  CommonUtil.loginUser!.user_profile!.contains('null')
                  // null문자를 포함하고 있다면 이미지를 기본이미지를 넣는다
                  ? AssetImage('lib/images/guest.png') as ImageProvider
                  : NetworkImage('${CommonUtil.loginUser!.user_profile}'),
                radius: 90,
              ),
              SizedBox(height: 40,),
              Text(
                '${CommonUtil.loginUser!.user_name}님 반갑습니다',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
