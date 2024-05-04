void main(){
  Car hyundai = Car(carMaker: 'HYUNDAI', typeCount: 10);
  hyundai.sayMaker();
  hyundai.sayTypeCount();

}

class Car{
  String carMaker;  // 회사
  int typeCount;  // 회사에서 만드는 차종

  // 네임드 생성자
  Car({
    required this.carMaker,
    required this.typeCount,
  });

  void sayMaker(){
    print('저는 ${this.carMaker}입니다');
  }
  void sayTypeCount(){
    print('${this.carMaker}는 ${this.typeCount}의 차종이 있습니다');
  }

}