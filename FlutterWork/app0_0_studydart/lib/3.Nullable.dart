void main(){
  // 변수 타입 뒤에 ? 를 붙이면 null값이 될수도 있다
  String? name = 'kim';
  name = null;
  print(name);
  name = 'choi';
  // name값은 절대 null이 아니다라는것을 명시
  print(name!);

}