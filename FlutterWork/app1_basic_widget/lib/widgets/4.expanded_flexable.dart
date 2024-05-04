import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandedFlexable extends StatelessWidget {
  const ExpandedFlexable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,  // 높이와 상관이 없다
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              //height: 100, // 높이를 우선시
              color: Colors.grey,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
