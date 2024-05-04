import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonWidget'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () {
                  print('텍스트 버튼이 눌렸습니다');
                },
                child: Text(
                  'Text Button',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber,
                  backgroundColor: Colors.grey,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text(
                      '스낵바를 보여 주었습니다 !!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.teal,
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        print('Undo 글자가 눌렸네요~~~');
                      },
                    ),
                  );

                  // 스낵바를 보여준다
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  '스낵바를 보여주겠습니다',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  // 토스트를 가져오기 위해서는 외부 라이브러리를 가져와야 한다
                  showToast('토스트가 띄워졌네요!!!');
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amberAccent,
                    backgroundColor: Colors.black,
                    side: const BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    )),
                child: const Text(
                  '토스트를 가져오겠습니다',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton.icon(
                // 비활성화 : onPress : null
                onPressed: (){},
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.amber,
                ),
                label: Text('Go to Home'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.black87,
                  minimumSize: Size(200, 10),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  /// 메세지를 받아 토스트 창을 띄워주는 매소드
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 20.0);
  }
} // class
