import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // 여러개를 쌓을 수 있는 위젯
        body: Center(
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.red,
              ),
              Positioned(
                top: 100,
                left: 50,
                //right: 50,
                child: Container(
                  height: 250,
                  width: 250,
                  color: Colors.blue,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
            ],
          ),
        ),
      
      ),
    );
  }
}
