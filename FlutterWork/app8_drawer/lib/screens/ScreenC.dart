import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('편지함'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('ScreenC', style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
