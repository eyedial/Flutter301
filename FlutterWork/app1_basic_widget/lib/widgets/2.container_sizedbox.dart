import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerSizedBox extends StatelessWidget {
  const ContainerSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 좌우로 센터, 위아래 X
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 담는공간
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    width: 16.0,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // 담는공간 : 주로 빈 공간을 주는데 사뇽
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  width: 16.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
