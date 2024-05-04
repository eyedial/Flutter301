// 한줄 주석
/*
* 여러줄 주석
*  */
// void : 반환타입(아무것도 받지 않겠다)
// main : 프로그램의 맨처음 실행되는 진입점
void main(){
  // print() 함수 : () 안에 있는 문자열 출력
  // 파일 실행 : 터미널창에 dart lib/1.HelloWorld.dart

  print('Hello World');
  print(add(3, 4));

  print("마에스터 소프트웨어 고등학교");

}
// 세개를 사용하면 문서주석으로 인식
/// 더하기 함수
int add(int a, int b){
  return a + b;
}