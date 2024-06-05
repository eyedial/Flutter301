import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('ScreenA', style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
