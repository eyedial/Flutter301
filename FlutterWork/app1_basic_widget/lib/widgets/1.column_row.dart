import 'package:flutter/material.dart';

class ColumnRow extends StatelessWidget {
  const ColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            // 주축(Column) 정렬 지정 : 여기서는 위 아래가 주축
            mainAxisAlignment: MainAxisAlignment.center,  // center
            // 반대축 정렬 지정 : 여기서는 좌 우 > 디폴트는 center
            crossAxisAlignment: CrossAxisAlignment.center,    //.end,
            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
              // SizedBox는 일반적으로 공백을 생성할 때 사용
              const SizedBox(height: 12.0),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
              const SizedBox(height: 12.0),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blue,
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                // 주축 정렬 지정 : 좌 우
                mainAxisAlignment: MainAxisAlignment.start,
                // 반대축 정렬 지정
                crossAxisAlignment: CrossAxisAlignment.center,
                // 넣고 싶은 위젯 입력
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.red,
                  ),
                  // SizedBox는 일반적으로 공백을
                  // 생성할 때 사용
                  const SizedBox(width: 12.0),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 12.0),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.blue,
                  ),
                ],
              )

            ],
          ),
        ),
      );

  }
}
