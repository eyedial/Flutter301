void main(){
  // 변수 : 어떤값을 저장할수 있는 공간 : 값은 변할수 있다 (변수이름 지을때 소문자로 시작)
  // var : 타입 추론 탑재
  var name = '마에스터';
  print(name.runtimeType);
  var num = 30;
  print(num.runtimeType);
  var isnum = false;
  print(isnum.runtimeType);
  //name= 3;
  //var name = 'BTS'; //

  // 변수타입
  // 정수
  int num1 = 10; //'10'
  int num2 = 20;

  print(num1 + num2);
  print(num1 - num2);
  print(num1 * num2);
  print(num1 / num2);

  // 실수
  double dNum1 = 20.5;

  // 맞다, 틀리다
  bool isTrue = true;

  // 문자열
  String str1 = '데스티니';

  // 타입변환
  // 정수 > 실수      실수 > 정수    문자열 > 정수      문자열 > 실수         정수 > 문자열
  // 정수.toDouble(), 실수.toInt(), int.parse(문자열) double.parse(문자열), 정수.toString()

  print(str1 + num1.toString());

  // 문저열 안에 변수값을 넣고 싶을때
  print('내가 프린트한 스트링은 ${str1} 입니다');
  print('내가 프린트한 스트링은 $str1 입니다');
  print('내가 프린트한 스트링은 ${str1.runtimeType} 입니다');

  dynamic dname = 'soft';
  print(dname.runtimeType);
  dname = 14;
  print(dname.runtimeType);







}