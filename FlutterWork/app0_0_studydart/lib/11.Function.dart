void main(){
  addNums();
  addNumsParaPosi(5, 8, 10);
  addNumsParaOption(25, 15);
  addNumsParaName(x: 10, z: 17, y: 15);
  addNumsParaName2(10, y: 12, z: 15);
}

/// 화살표 함수
addNumsArrow(int x, int y, int z) => x + y + z;


/// named Parameter
void addNumsParaName2(
  int x,
  {
    required int y,
    int z=0
  }) {
  print('addNums');
  print('x:$x, y:$y, z:$z');
  int sum = x + y + z;
  if (sum % 2 == 0) {
    print('짝수입니다');
  } else {
    print('홀수입니다');
  }
}

/// named Parameter
void addNumsParaName({
  required int x,
  required int y,
  required int z
  }){
  print('addNums');
  print('x:$x, y:$y, z:$z');
  int sum = x + y + z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else{
    print('홀수입니다');
  }

}

/// Optional Parameter : 
void addNumsParaOption(int x, [int y=0, int z=0]){
  print('addNums');
  print('x:$x, y:$y, z:$z');
  int sum = x+y+z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else{
    print('홀수입니다');
  }

}

/// 반드시 선언한 파라메타 순서대로 넣어야 한다
void addNumsParaPosi(int x, int y, int z){
  print('addNums');
  print('x:$x, y:$y, z:$z');
  int sum = x+y+z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else{
    print('홀수입니다');
  }

}

/// 함수(매소드) : 반복적인 일을 수행하고자 할때 재활용성을 위해 따로 만든 매소드
/// 세개의 숫자를 더하고 짝수인지 홀수인지 알려주는 함수
void addNums(){
  print('addNums');
  int x=10, y=20, z=30;
  print('x:$x, y:$y, z:$z');
  int sum = x+y+z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else{
    print('홀수입니다');
  }

}

