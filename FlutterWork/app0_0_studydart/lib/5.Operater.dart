void main(){
  // operater : 연산자
  /*int num1 = 10;
  int num2 = 20;

  print(num1 + num2);
  print(num1 - num2);
  print(num1 * num2);
  print(num1 / num2);  // 몫

  // 나머지 연산자
  print(num1 % num2);

  // 변수값이 변한다
  num1++;  // num1 = num1 + 1;
  print(num1);

  num1--; // num1 = num1 - 1;
  print(num1);

  num1 += 3; // // num1 = num1 + 3; -=, *=, /=
  print(num1);

  double? dnum = 4.0;
  dnum = null;

  dnum = 12.0;
  dnum ??= 5.0;
  print(dnum);
  dnum = null;
  dnum ??= 5.0;
  print(dnum);

  // 비교연산자 : bool값으로 치환된다
  print(num1 > num2);
  print(num1 < num2);
  print(num1 >= num2);
  print(num1 <= num2);
  print(num1 == num2);
  print(num1 != num2);*/

  // 논리연산자 &&(모두가 참일때 참), ||(어느 한개만 참이면 참)
  bool result = (12>10) && (1>0);
  print(result);
  result = (12<10) && (1>0);
  print(result);

  result = (12>10) || (1>0);
  print(result);
  result = (12<10) || (1>0);
  print(result);
  result = (12>10) || (1<0);
  print(result);
  result = (12<10) || (1<0);
  print(result);



}