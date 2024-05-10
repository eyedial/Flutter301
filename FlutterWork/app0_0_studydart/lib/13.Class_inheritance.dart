void main() {
  Car hyundai = Car(carMaker: 'HYUNDAI', typeCount: 10);
  hyundai.sayMaker();
  hyundai.sayTypeCount();

  HyunDai sonata = HyunDai(
    carMaker: '현대',
    typeCount: 5,
    carName: '소나타',
  );
  sonata.sayCarName();
}

class Car {
  String carMaker; // 회사
  int typeCount; // 회사에서 만드는 차종

  // 네임드 생성자
  Car({
    required this.carMaker,
    required this.typeCount,
  });

  void sayMaker() {
    print('저는 ${this.carMaker}입니다');
  }

  void sayTypeCount() {
    print('${this.carMaker}는 ${this.typeCount}의 차종이 있습니다');
  }
}

class HyunDai extends Car {
  String carName;

  // 부모 생성자도 샹속 : this 는 자신에게 있는것, super 부모에게 있는것 지칭
  HyunDai({
    required super.carMaker,
    required super.typeCount,
    required this.carName,
  });

  sayCarName() {
    print('저는 ${super.carMaker}이고 ${super.typeCount}의 차종을 만들고'
        ' 차이름은 ${this.carName}입니다');
  }
}
