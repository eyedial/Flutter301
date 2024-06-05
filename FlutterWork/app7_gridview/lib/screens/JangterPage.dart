import '/common/Common.dart';
import '/models/JangterModel.dart';
import '/screens/DetailPage.dart';
import 'package:flutter/material.dart';

class JangterPage extends StatefulWidget {
  const JangterPage({super.key});

  @override
  State<JangterPage> createState() => _JangterPageState();
}

class _JangterPageState extends State<JangterPage> {

  // 이미지를 사용하기 위해서는 pubspec.yaml에 asset 추가를 해야 한다
  List<String> imgPath = [
    'lib/images/1.webp',
    'lib/images/2.webp',
    'lib/images/3.webp',
    'lib/images/4.webp',
    'lib/images/5.webp',
    'lib/images/6.webp',
    'lib/images/7.webp',
    'lib/images/8.webp',
    'lib/images/9.webp',
    'lib/images/10.webp',
  ];

  List<String> title = [
    '스타우브 꼬꼬떼 팝니다.',
    '필요하신 차키 팝니다!',
    '바오바오백 팔아요',
    '엄마가ㅠ 빨리 빨리 빨리 당근에 올리래요.',
    '몽클레어 후드집업',
    '신세계 상품권 10만원권 2장',
    '재고정리 18인치 캐리어 새상품',
    '튼튼한 원목의자 벤치의자',
    '오이',
    '아기내복 아기실내복 상하세트',
  ];

  List<String> price = [
    '40,000원',
    '5,000원',
    '5,000원',
    '22,000원',
    '80,000원',
    '150,000원',
    '20,000원',
    '10,000원',
    '15,000원',
    '4,500원',
  ];

  List<String> address = [
    '서울 강남구 대치1동',
    '인천 부평구 산곡3동',
    '서울 영등포구 여의도동',
    '부산 연제구 연산제5동람',
    '서울 강남구 대치1동',
    '대구 북구 국우동',
    '광주 광산구 쌍암동',
    '대전 동구 용전동',
    '경기도 양주시 회천4동',
    '강원도 원주시 무실동',
  ];

  List<String> liked = ['5', '3', '1', '3', '4', '7', '2', '5', '9', '11'];

  @override
  Widget build(BuildContext context) {
    // 지금 구동되고 있는 폰의 가로 세로 크기를 알 수 있다
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 위에 있는 리스트들을 장터모델에 넣는다
    final List<JangterModel> jangterModels = List.generate(
        title.length,
            (index) => JangterModel(imgPath: imgPath[index], title: title[index],
             price: price[index], address: address[index], liked: liked[index])
    );
    print('-----------------------length');
    print(jangterModels.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview - 동네 장터'),
        elevation: 0,
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
      ),

      body: GridView.builder(
        // 보여줘야할 갯수 : 리스트의 갯수
        itemCount: jangterModels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 가로로 몇개를 배치할 것인가
          crossAxisCount: 2,
          // 가로끼리 얼마나 공간을 띄울것인가
          crossAxisSpacing: 10,
          // 위 아래로 얼마나 공간을 띄울것인가
          mainAxisSpacing: 10,
          // Gridview Tile 높이조정 : 반드시 높이 조절시 필요
          mainAxisExtent: 260,
        ),
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                // 이미지를 클릭하면 물품의 자세한 내용을 가진 팝업창이 뜨게 한다
                InkWell(
                  onTap: (){
                    Common.showPopup(context, title[index], imgPath[index],
                        price[index], address[index], liked[index]);
                  },
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    child: Image(image: AssetImage(jangterModels[index].imgPath!)),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    // 클릭 했을때
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        // 물품 상세 정보를 보여주기 위해 선택된 장터모델을 넘겨준다
                          builder: (context) => DetailPage(
                              jangterModel:  jangterModels[index])
                          )
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jangterModels[index].title!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            jangterModels[index].price!,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            jangterModels[index].address!,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
