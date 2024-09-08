import 'dart:io';

import 'package:app13_splash_jangter/common/CommonUtil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../../service/UserService.dart';

class JoinUser extends StatefulWidget {
  const JoinUser({super.key});

  @override
  State<JoinUser> createState() => _JoinUserState();
}

class _JoinUserState extends State<JoinUser> {

  final imagePicker = ImagePicker();
  File? profile_image;
  String? profile_imgPath;

  TextEditingController ctrlId = TextEditingController();
  TextEditingController ctrlPw = TextEditingController();
  TextEditingController ctrlName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        // 관리의 용이성을 위해 Form사용
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // 위 아래 센터로 위치
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 프로필 사진 :
                  // image picker, gellary saver, 권한설정 : gradle 23
                  // android > app > src > build.gradle
                  Center(
                    child: CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width * 0.25,
                      // 삼항연산자를 이용해 이미지가 null 이면 기본이미지를 보여주고
                      // 이미지가 null이 아닐때는 선택된 이미지를 보여준다
                      backgroundImage:
                      profile_image != null
                      ? FileImage(File(profile_image!.path)) as ImageProvider
                      : AssetImage('lib/images/camera.png'),
                    ),
                  ),
              
                  SizedBox(height: 5,),
              
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      // 갤러리에서 가져오기 : Image_picker 사용 > 객체생성
                      ElevatedButton(
                        onPressed: (){
                          getFromGallery();
                        },
                        child: Text('갤러리'),
                      ),
                      SizedBox(width: 10,),
                      // 카메라에서 찍어서 가져오기
                      ElevatedButton(
                        onPressed: (){
                          getFromCamera();
                        },
                        child: Text('카메라'),
                      ),
                    ],
                  ),
              
                  SizedBox(height: 10,),
              
                  TextFormField(
                    // 각 텍스트폼필드 영역에 접근하기 위해서는 controller를 달아줘야한다
                    controller: ctrlId,
                    decoration: InputDecoration(
                      // 입력줄 앞에 아이콘을 붙여줄수 있다
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black87,
                      ),
                      hintText: 'User ID : 3글자 이상',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      // 입력줄 바깥쪽에 윤곽선을 만들어 준다
                      enabledBorder:  buildOutlineInputBorder(),
                      // 포커스가 있을때도 모양을 유지시켜 준다
                      focusedBorder:  buildOutlineInputBorder(),
                      errorBorder:  buildOutlineInputBorder(),
                      // 하지만 글자에 비해 창 크기가 너무 크다
                      // TextFormField에서 자주 사용되므로 잘 기억
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    // 각 텍스트폼필드 영역에 접근하기 위해서는 controller를 달아줘야한다
                    controller: ctrlPw,
                    decoration: InputDecoration(
                      // 입력줄 앞에 아이콘을 붙여줄수 있다
                      prefixIcon: Icon(
                        Icons.enhanced_encryption_sharp,
                        color: Colors.black87,
                      ),
                      hintText: 'User PW : 3글자 이상',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      // 입력줄 바깥쪽에 윤곽선을 만들어 준다
                      enabledBorder:  buildOutlineInputBorder(),
                      // 포커스가 있을때도 모양을 유지시켜 준다
                      focusedBorder:  buildOutlineInputBorder(),
                      errorBorder:  buildOutlineInputBorder(),
                      // 하지만 글자에 비해 창 크기가 너무 크다
                      // TextFormField에서 자주 사용되므로 잘 기억
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    // 각 텍스트폼필드 영역에 접근하기 위해서는 controller를 달아줘야한다
                    controller: ctrlName,
                    decoration: InputDecoration(
                      // 입력줄 앞에 아이콘을 붙여줄수 있다
                      prefixIcon: Icon(
                        Icons.face,
                        color: Colors.black87,
                      ),
                      hintText: 'User Name',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      // 입력줄 바깥쪽에 윤곽선을 만들어 준다
                      enabledBorder:  buildOutlineInputBorder(),
                      // 포커스가 있을때도 모양을 유지시켜 준다
                      focusedBorder:  buildOutlineInputBorder(),
                      errorBorder:  buildOutlineInputBorder(),
                      // 하지만 글자에 비해 창 크기가 너무 크다
                      // TextFormField에서 자주 사용되므로 잘 기억
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(height: 8,),

                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      // 가입하기 누르면 유효성 검사 후 수파베이스에 저장
                      ElevatedButton(
                        onPressed: () async {
                          // 텍스트에 접근 : 붙여놓은 controller로 접근
                          // 유효성 검사 : 아이디, 암호 모두 3자리 이상
                          String id = ctrlId.text;
                          String pw = ctrlPw.text;
                          String name = ctrlName.text;
                          if(id.length < 3 || pw.length < 3){
                            // 스낵바로 정보를 알려준다
                            ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                              content: Text(
                                '회원 아이디나 비밀번호가 비었거나 3자리 미만입니다',
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 3),
                            ));
                            return;
                          }
                          // 유효성 문제가 없다면 회원가입을 진행한다
                          // id외 pw를 가지고 수파베이스에 넘기면
                          // 넘어온 확인문자로 회원가입이 됐는지 확인한다
                          bool isJoin = await joinUser(id, pw, name, profile_image);
                          // 회원가입이 성공적으로 끝났으면 : 넘어온 값이 true
                          // 회원가입 화면을 없애고 로그인 화면으로 전환
                          if(isJoin){
                            Navigator.pop(context);
                            CommonUtil.showToast('축하합니다\n정상적으로 가입되었습니다');
                          }else{
                            CommonUtil.showToast('죄송합니다\n다시 시도해 주세요');
                          }
                        },
                        child: Text('가입하기'),
                      ),
                      SizedBox(width: 10,),
                      // 나중에 버튼을 누르면 로그인 화면으로 다시 돌아간다
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('나중에'),
                      ),
                    ],
                  )
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(35)),
            );
  }

  /// 갤러리에서 이미지 가져오기
  void getFromGallery() async {
    // ImagePicker 객체를 위에서 선언
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // 어떤 상태값이 변화했을때 반드시 setState를 호출하여 저장을 해 줘야 한다
    if(pickedFile != null){
      setState(() {
        profile_image = File(pickedFile.path);
        profile_imgPath = pickedFile.path;
      });
    }
  }

  /// 카메라에서 이미지 가져오기
  void getFromCamera() async {
    // ImagePicker 객체를 위에서 선언
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // 어떤 상태값이 변화했을때 반드시 setState를 호출하여 저장을 해 줘야 한다
    if(pickedFile != null){
      setState(() {
        profile_image = File(pickedFile.path);
        profile_imgPath = pickedFile.path;
        // 저장
        saveToGallery();
      });
    }
  }

  /// 갤러리에 저장하기
  Future<void> saveToGallery() async {
    // gallery saver를 호출
    await GallerySaver.saveImage( // 비디오파일 : saveVideo
      profile_image!.path,  // 이미지파일이 어디에 있는지 알려줌
      // albumName : "폴더명",
    );
    setState(() {});
  }

}
