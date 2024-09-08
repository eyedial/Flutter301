import 'dart:convert';

import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;

/// 경로 알아오기 : 빠른길 : Direction15 > route > trafast > 0 > path
///               최적길 : Direction5 > route > traoptimal > 0 > path
Future<List<NLatLng>> feachPath(NLatLng startLoc, NLatLng endLoc) async{
  // 넘어온 경로를 받기위함
  List<NLatLng> path = [];
  // naver API를 이용하여 경로를 찾는다
  // > https://console.ncloud.com/naver-service/application > 인증정보
  final res = await http.get(
      Uri.parse('https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving'
          '?start=${startLoc.longitude},${startLoc.latitude}'
          '&goal=${endLoc.longitude},${endLoc.latitude}'),
      headers: {
        'X-NCP-APIGW-API-KEY-ID': 'fhwc04ibwb',
        'X-NCP-APIGW-API-KEY': 'liOwN0S1J9SJTI2qk7eHiHr2af7rdXd1fTyTgDQH'
      }
  );
  // 정상적인 응답이 오면 : 200
  if(res.statusCode == 200){
    // 한글이 깨지지 않게 bytes로 받아서 utf8로 변환시킴 :
    // postman > curl 형태로 변형해서 응답을 받음 : online jsonviewer
    final data = json.decode(utf8.decode(res.bodyBytes));
    print('====================== response data');
    print(data);
    // 경로만 따로 저장 : [longitude, latitude]
    final route = data['route']['traoptimal'][0]['path'] as List<dynamic>;
    print('======================= route');
    print(route);
    // 네이버 맵 형태로 저장 : NLatLng(latitude, longitude) 형태
    path = route.map((e) => NLatLng(e[1], e[0])).toList();
    print('======================= path');
    print(path);
  }

  return path;
}