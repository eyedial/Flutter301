void main(){

  Car sonata = Car('SONSTA', ['마법거울', '스케이트바퀴']);
  sonata.sayName();
  sonata.sayOption();

}

class Car{
  String carName;
  List<String> carOption;

  // 생성자 : 기본
  /*Car(String carName, List<String> carOption)
  : this.carName = carName, this.carOption = carOption;*/

  // 생성자 : 간단히
  Car(this.carName, this.carOption);

  sayName(){
    print('이차의 이름은 ${this.carName}입니다');
  }

  sayOption(){
    print('저의 옵션은 ${carOption}들이 있습니다');
  }

}