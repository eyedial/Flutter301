import 'dart:convert';
import 'dart:io';

import 'package:app13_splash_jangter/common/CommonUtil.dart';
import 'package:app13_splash_jangter/model/JangterModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:postgres/postgres.dart';

import '../model/UsersModel.dart';
// 수파베이스의 API 이용
// Project URL
final supabaseUrl = 'https://bmiwvlbcbvbqcrpplako.supabase.co';
// Project Anon key
final supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtaXd2bGJjYnZicWNycHBsYWtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ1MzMxNjEsImV4cCI6MjAzMDEwOTE2MX0.EBopUcFBKFT5JnrSQBCjTKfAIsBiGVdO6aL3bnbR74o';
// 객체생성
SupabaseClient supabase = SupabaseClient(supabaseUrl, supabaseKey);

// postgres : 설정에 들어가서 configure 데이터베이스에 가면 있다 : 수파베이스에 직접연결
// PostgreSQL : 데이터베이스에 직접 연결하는 객체 생성
Future<Connection> postgresConn() async{
  final conn = await Connection.open(Endpoint(
    host: 'aws-0-ap-northeast-2.pooler.supabase.com',
    database: 'postgres',
    username: 'postgres.bmiwvlbcbvbqcrpplako',
    password: '!css16440263',
  ));
  return conn;
}

/// 수파베이스 스토리지에 프로파일 이미지 올리기 : 저장후 경로 찾아야 함
/// 회원가입을 할때 아이디 중복체크를 해야 한다
Future<bool> joinUser(String user_id, String user_pw, String user_name,
    File? profile_image) async{
  // 넘겨온 데이터를 출력해본다
  //print('$user_id, $user_pw, $user_name, ${profile_image!.path}');

  String imageUrl; // 스토리지에 이미지 저장하고 난 그 스토리지 경로
  final profile_imgPath = 'pic/$user_id'; // 스토리지에 이미지 넣을 경로와 이름
  // 만약에 프로파일 이미지가 null이 아니면 스토리지에 저장하고 회원정보저장
  if(profile_image != null) {
    await supabase.storage
        .from('user_profile')
        .upload(profile_imgPath, profile_image);

    // 스토리지에 저장한 이미지 경로를 가져와서 imageUrl에 저장한다
    imageUrl =
        supabase.storage.from('user_profile').getPublicUrl(profile_image.path);
    print('imageUrl : $imageUrl');
    // https://bmiwvlbcbvbqcrpplako.supabase.co/storage/v1/object/public/user_profile/pic/jjj
    // https://bmiwvlbcbvbqcrpplako.supabase.co/storage/v1/object/public/user_profile//data/user/0/com.example.app13_splash_jangter/cache/scaled_1000000038.jpg
    // 수파베이스에서 실질적으로 사용하는 경로와 imageUrl로 사용하는 경로가 다르다
    // 그래서 내가 사용할수 있는 경로로 변환시킨다
    imageUrl = imageUrl.split('//data')[0] + '/$profile_imgPath';
    print('imageUrl : $imageUrl');

    // 이미지가 저장되고 경로를 알았으므로 회원정보를 테이블에 저장
    final response = await supabase.from('Users').insert([
      {
        'user_id': user_id,
        'user_pw': user_pw,
        'user_name': user_name,
        'user_profile': imageUrl,
      },
    ]).select();
    print('response: $response');

    return true;
  // 이미지 파일이 null이면 : 프로파일 이미지를 사용하지 않겠다 , null로 저장
  }else{
    final response = await supabase.from('Users').insert([
      {
        'user_id': user_id,
        'user_pw': user_pw,
        'user_name': user_name,
      },
    ]).select();
    print('response: $response');

    return true;
  }
}

login(user_id, user_pw) async {
  final response = await supabase
      .from('Users')
      .select() //;
      .eq('user_id', user_id)
      .eq('user_pw', user_pw);

  print('response : $response');

  String raw = response.toString();
  String jsonString = convertToJsonStringQuotes(raw: raw);
  print('jsonString : $jsonString');

  List<dynamic> listMembers = jsonDecode(jsonString);
  print('listMembers : $listMembers');

  List<UserModel> users = [];
  for(var user in listMembers){
    users.add(UserModel.fromJson(user));
  }
  print('users.length : ${users.length}');
  //print(users[0].toPrint());

  if(users.length > 0){
    // 로그인이 됨
    CommonUtil.loginUser = users[0];
    print('loginUser : ${CommonUtil.loginUser!.user_id}');
  }else{
    // 로그인이 안됨
    CommonUtil.loginUser = null;
    print('loginUser가 없습니다 !!!');
  }
}

/// 문자열에 따옴표 없는것들을 따옴표 붙여주는 매소드
String convertToJsonStringQuotes({required String raw}) {
  String jsonString = raw;

  /// add quotes to json string
  jsonString = jsonString.replaceAll('{', '{"');
  jsonString = jsonString.replaceAll(': ', '": "');
  jsonString = jsonString.replaceAll(', ', '", "');
  jsonString = jsonString.replaceAll('}', '"}');

  /// remove quotes on object json string
  jsonString = jsonString.replaceAll('"{"', '{"');
  jsonString = jsonString.replaceAll('"}"', '"}');

  /// remove quotes on array json string
  jsonString = jsonString.replaceAll('"[{', '[{');
  jsonString = jsonString.replaceAll('}]"', '}]');

  return jsonString;
}

/// 수파베이스 Jangter table 에서 등록해 놓은 물품을 모두 가져온다
/// 가장 최신 등록순으로 가져온다
Future<List<JangterModel>> getJangter() async{
  final conn = await postgresConn();
  final result = await conn.execute(
      ' select *  '
      ' from public."Jangter" '
      ' order by "Jangter"."created_at" desc '
  );
  print('result : $result');
  List<JangterModel> jangterList = [];
  // 쿼리 결과를 리스트에 담는다
  for(final row in result){
    print('row : $row');
    int id = int.parse(row[0].toString());
    String imgPath = row[1].toString();
    String title = row[2].toString();
    int price = int.parse(row[3].toString());
    String address = row[4].toString();
    int liked = int.parse(row[5].toString());
    int chatting = int.parse(row[6].toString());
    String created_at = row[7].toString();
    String contents  = row[7].toString();

    jangterList.add(
        JangterModel(id: id, imgPath: imgPath, title: title,
          price: price, address: address, liked: liked,
          chatting: chatting, created_at: created_at, content: contents));
  }
  print('jangterList : $jangterList');
  // 데이터베이스 연결 닫기
  await conn.close();

  return jangterList;
}