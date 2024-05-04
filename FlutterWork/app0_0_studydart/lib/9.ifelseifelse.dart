void main(){
  // if(조건식){} 형태 :  조건식이 참이면 수행, 거짓이면 수행안함
  int num = 9;
  if(num % 2 == 0){ // num이 짝수인가
    print('짝수입니다');
  }else{   // 짝수가 아니면
    print('홀수입니다');
  }

  if(num % 3 == 0){
    print('나머지가 0입니다');
  }else if(num % 3 == 1){
    print('나머지가 1입니다');
  }else{
    print('나머지가 2입니다');
  }

  // switch(식), case 식에서 나올수 있는값,  break 문
  int num1 = 23;
  switch(num1 % 3){
    case 0:
      print('나머지가 0입니다');
      break;
    case 1:
      print('나머지가 1입니다');
      break;
    case 2:
      print('나머지가 2입니다');
      break;

  }




}