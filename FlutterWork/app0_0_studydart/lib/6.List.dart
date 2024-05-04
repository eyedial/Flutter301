// List는 컬렉션 : 여러값을 하나의 변수에 저장할수 있는 타입 > List, Map, Set
void main(){
  List<String> muhan = ['aaa', 'bbb', 'ccc', 'ddd'];
  List<int> nums = [1,2,5,7];

  // 접근방법 : 인덱스 - 0부터 시작
  print(muhan[0]);
  print(muhan[1]);
  print(muhan[2]);
  print(muhan[3]);
  //print(muhan[4]); // 인덱스 에러

  // 추가 : 맨마지막, add, addAll
  muhan.add('eee');
  print(muhan);
  muhan.addAll(['ccc', 'fff']);
  print(muhan);

  // 지우기 : remove(문자열), removeAt(인덱스)
  muhan.remove('ccc');
  print(muhan);
  muhan.removeAt(5);
  print(muhan);

  // 원하는 문자열의 인덱스 알아보기 : indexOf(문자열00)
  print(muhan.indexOf('ddd'));

  List<dynamic> dArrs = ['strtr', 2, bool, 32.0];
  print(dArrs);

}