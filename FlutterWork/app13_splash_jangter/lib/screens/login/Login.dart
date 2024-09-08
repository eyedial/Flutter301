import 'package:app13_splash_jangter/common/CommonUtil.dart';
import 'package:app13_splash_jangter/service/UserService.dart';

import '../BottomNavi.dart';
import '/screens/login/JoinUser.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextField의 값이 변화 되었는지 혹은 값을 가져오고 싶을때는 controller을 생성해서 붙여줘야 한다
  // 그리고 사용후에는 마지막에 dispose를 사용하여 메모리에서 제거해 주는게 좋다
  TextEditingController ctrlId = TextEditingController();
  TextEditingController ctrlPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login - Supabase'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/images/login2.png'),
                radius: MediaQuery.sizeOf(context).width * 0.23,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.red,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ))),
                  child: Container(
                    padding:
                        EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.1),
                    child: Column(
                      children: [
                        TextField(
                          controller: ctrlId,
                          decoration: InputDecoration(
                            labelText: 'Enter "ID"',
                          ),
                          // 어뗜 형태를 입력할것인지 키보드 형태를 지정
                          keyboardType: TextInputType.text,
                          //keyboardType: TextInputType.emailAddress,
                          //keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: ctrlPw,
                          decoration: InputDecoration(
                            labelText: 'Enter "PW"',
                          ),
                          // 어뗜 형태를 입력할것인지 키보드 형태를 지정
                          keyboardType: TextInputType.text,
                          //keyboardType: TextInputType.emailAddress,
                          //keyboardType: TextInputType.phone,
                          // 타이핑시 패스워드는 보이지 않아야 한다
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonBar(
                // 버튼들이 가운데로 정렬
                alignment: MainAxisAlignment.center,
                children: [
                  // 로그인 버튼 : 수파베이스에서 아이디와 패스워드를 확인한 후
                  //   Users테이블에 있다면 CommonUtil에 static으로 만들어 놓은
                  //   loginUser에 저정하여 어디서는 접근할수 있도록 한다
                  ElevatedButton(
                    onPressed: () async {
                      // 아이디와 비번을 가져와 수파베이스 테이블에 존재하는가 확인
                      String user_id = ctrlId.text;
                      String user_pw = ctrlPw.text;
                      // 수파베이스에 연결해 회원정보 테이블에 내가 보낸것과 동일한 것이
                      // 있으면 회원정보 모두를 가져와서 loginUser에 저장한다
                      await login(user_id, user_pw);
                      // 로그인 유저가 있으면 바텀네비게이션바 페이지로 이동한다
                      if(CommonUtil.loginUser != null){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavi()),
                        );

                      // 로그인 유저가 없으면 안내 스낵바를 띄운다
                      }else{
                        ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                            content: Text(
                              '로그인 정보를 확인해 주세요 !!!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.blueAccent,
                        ));
                      }


                    },
                    child: Text('로그인'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // 회원가입 버튼
                  ElevatedButton(
                    // 회원가입 화면으로 전환한다
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JoinUser(),
                        ),
                      );
                    },
                    child: Text('회원가입'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
