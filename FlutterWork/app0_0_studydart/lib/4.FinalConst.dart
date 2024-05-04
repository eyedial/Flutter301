void main(){
  // 선언을 하면 값을 바꿀수 없다
  // const는 컴파일 할때 바꿀수 없고 final은 런타임시 바끌수 없다
  final int max = 100;
  const int min = 10;

  // max = 200;
  // min = 20;

  // 런타임시 결정짓는 시간 : DateTime()함수
  // const DateTime now1 = DateTime.now();

  final DateTime now2 = DateTime.now();
  print(now2);

  for(int i=0; i<10000; i++){

  }

  final DateTime now3 = DateTime.now();
  print(now3);

}