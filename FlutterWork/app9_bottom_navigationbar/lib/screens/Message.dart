import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  // 삼항연산자
  // 조건식 ? 항1 : 항2
  // 조건식이 참이면 항1을 수행하고 거짓이면 항2를 수행한다
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
        itemCount: 2,
        itemBuilder: (context, index){
          if(index == 0){
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Hello I am a large school\nin the Kwangju 첫번째',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            );
          }
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Hello I am a large school\nin the Kwangju 두번째',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
          );
        }

    );
  }
}
