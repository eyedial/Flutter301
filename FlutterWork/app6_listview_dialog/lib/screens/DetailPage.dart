import 'package:app6_listview_dialog/models/JangterModel.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class DetailPage extends StatelessWidget {
  JangterModel? jangterModel;

  // 생성자에서 부모로 부터 넘겨준 값들을 받는다
  DetailPage({super.key, required this.jangterModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('물품 상세 정보'),
        backgroundColor: Colors.amber,
      ),
      body:  Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              // 위 아래의 가운데 정렬
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    jangterModel!.imgPath!,
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  jangterModel!.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  jangterModel!.price!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  jangterModel!.address!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15,),
                LikeButton(
                  isLiked: false,
                  likeCount: int.parse(jangterModel!.liked!),
                ),
                SizedBox(height: 15,),
                ElevatedButton.icon(
                  // 창을 닫는다
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                  label: Text('닫기'),
                )
        
              ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
