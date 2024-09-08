import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../service/DirectionService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // 내 위치
  final NLatLng myLocation = NLatLng(35.14276897, 126.800772);
  // 다른 위치
  final NLatLng otherLocation = NLatLng(35.1523232, 126.8524468);

  late NaverMapController mapController;

  @override
  Widget build(BuildContext context) {

    List<NLatLng> path = [];

    return Scaffold(
      body: NaverMap(
        // 지도를 보여줄때의 옵션 설정
        options: NaverMapViewOptions(
          // 지도를 가져올때 맨처음 보여주는 위치 : 위도, 경도 > NLatLng
          initialCameraPosition: NCameraPosition(
            target: NLatLng(35.14276897, 126.800772),
            // 지도를 보는 넓이 > 넓게 : 숫자 작게, 자세히 : 숫자 크게
            zoom: 15,
            bearing: 0,
            tilt: 0,
          ),
          // 지도를 키웠다 줄였다
          zoomGesturesEnable: true,
          // 지도 유형
          mapType: NMapType.basic,
          activeLayerGroups: [
            // 건물주소 입구
            NLayerGroup.building,
            // 대중교통
            NLayerGroup.transit
          ],
          locale: Locale('kr'),
        ),

        // 지도가 보여질 준비가 되었을때 하는 것
        onMapReady: (controller){
          mapController = controller;

          print('네이버 맵 로딩됨');
          // 마커를 찍어보자 : 내 위치 > 소마고
          final markerMyLoc = NMarker(
              id: '1',
              position: myLocation,
          );
          // 컨트롤러에 오버레이를 추가해 줘야 지도에 나타난다
          controller.addOverlay(markerMyLoc);
          // 마커에 정보창을 띄울수 있다
          final onMarkerInfoWindow = NInfoWindow.onMarker(
            id: markerMyLoc.info.id,
            text: '꺾이지 않은 마음',
          );
          // 정보창을 마커에 붙여준다
          markerMyLoc.openInfoWindow(onMarkerInfoWindow);

          // 양쪽에 거리구하기
          int distance = myLocation.distanceTo(otherLocation).round();

          // 다른곳의 지점에 마커를 찍는다
          final markerOther = NMarker(
            id: '2',
            position: otherLocation,
          );
          controller.addOverlay(markerOther);
          // 마커에 정보창을 띄울수 있다
          final onMarkerInfoWin2 = NInfoWindow.onMarker(
            id: markerOther.info.id,
            text: '$distance m',
          );
          // 정보창을 마커에 붙여준다
          markerOther.openInfoWindow(onMarkerInfoWin2);
        },
        // 지도를 클릭했을때 : 클릭한 화면위치, 좌표상의 위치
        onMapTapped: (point, latlng){
          print('============================ latlng');
          print('latitude: ${latlng.latitude},\nlongitude: ${latlng.longitude}');
          print('pointX: ${point.x},\npointY: ${point.y}');
        },
      ),

      // 플로팅 액션 버튼 생성
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          // 경로 가져오기
          path = await feachPath(myLocation, otherLocation);
          print('======================= path2');
          print(path);

          // 경로를 추가하기 위해서는 반드시 컨트롤러에 오버레이를 추가해야 한다.
          NPathOverlay pathOverlay = NPathOverlay(
            id: 'test',
            coords: path,
            color: Colors.red,
            width: 4,
          );
          mapController.addOverlay(pathOverlay);

        },
        child: Icon(Icons.location_on),
      ),
      // 플로팅 액션 버튼 위치 지정
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
