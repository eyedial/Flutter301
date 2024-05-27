
class JangterModel{
  // 테이블에 있는 모든 칼럼수와 이름도 동일하게 사용
  // > 데이터베이스에 있는 데이터를 가져와서 쓰기때문에
  String? imgPath, title, price, address, liked;

  // 생성자: 네임드
  JangterModel({this.imgPath, this.title, this.price, this.address, this.liked});

}