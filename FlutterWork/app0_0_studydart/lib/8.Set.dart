// Set : {}형태, List와 동일하나 중복값을 제거해 준다
void main(){
  Set<String> names = {
    'aaa', 'bbb', 'ccc'
  };

  names.add('ddd');
  print(names);
  names.remove('ddd');
  print(names);
  names.add('aaa');
  print(names);



}