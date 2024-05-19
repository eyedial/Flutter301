import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // State > 데이터를 감시하여 변화하면 전체의 화면을 재빌드(재구성)하지 않고
  // 변화된 데이터만 갱신(빌드) 시켜 준다
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed\nthe buttons this many times',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15,),
              Text(
                '$counter',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      // 변수의 데이터가 변화하는것을 화면에 적용시키기 위해서는
                      // 아래의  setState()라는 매소드를 불러와야 한다
                      setState(() {
                        counter++;
                      });
                      print(counter);
                    },
                    foregroundColor: Colors.amberAccent,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        counter--;
                      });
                      print(counter);
                    },
                    foregroundColor: Colors.amberAccent,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.remove),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
