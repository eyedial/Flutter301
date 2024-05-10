

void main(){
  showData();
}

void showData() async {
  startTask();
  String? info = await accessData();
  fetchData(info);
}

void startTask(){
  String info1 = '요청 수행 시작';
  print(info1);
}

Future<String?> accessData() async {
  String? info2;
  await Future.delayed(Duration(seconds: 3),(){
    info2 = '20만원';
    print(info2);
  });
  return info2;
}

void fetchData(String? info){
  String info3 = '잔액은 $info입니다';
  print(info3);
}