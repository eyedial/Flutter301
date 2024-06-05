import 'package:flutter/material.dart';

class ScreenE extends StatelessWidget {
  const ScreenE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('ScreenE', style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
