import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/UsersModel.dart';

class CommonUtil{
  // loginUser : 모든곳에서 접근할 수 있게 static
  static UserModel? loginUser;

  /// 토스트 메세지 띄우는 매서드 : Fluttertoast 라이브러리 필요
  static void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16,
    );
  }

}