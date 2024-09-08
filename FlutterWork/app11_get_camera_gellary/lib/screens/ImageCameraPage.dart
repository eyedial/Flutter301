import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageCameraPage extends StatefulWidget {
  const ImageCameraPage({super.key});

  @override
  State<ImageCameraPage> createState() => _ImageCameraPageState();
}

class _ImageCameraPageState extends State<ImageCameraPage> {
  final imagePicker = ImagePicker();
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FittedBox : 무언가 들어갈 공간
          Container(
            margin: EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.3,
            color: Colors.grey,
            child: FittedBox(
              // 삼항연산자로 inageFile 이 null 일때는 user.png를 보여주고
              // null이 아닐때는 선택한 이미지를 보여준다
              child: imageFile != null
                    ? Image.file(File(imageFile!.path), fit: BoxFit.fitWidth,)
                    : Image.asset('lib/images/user.png'),
            ),
          ),

          ElevatedButton(
            onPressed: (){
              showPictureDialog();
            },
            child: Text(
              '눌러서 선택해주세요',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              fixedSize: Size(size.width - 40, size.height * 0.07),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: imageFile != null
                  ? FileImage(File(imageFile!.path)) as ImageProvider
                  : AssetImage('lib/images/user.png'),
            ),
          )
          
        ],
      ),
    );
  }

  void showPictureDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text('Select Action'),
            children: [
              SimpleDialogOption(
                child: Text('Open Gellary'),
                onPressed: (){
                  getFromGellary();
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Open Camera'),
                onPressed: (){
                  getFromCamera();
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
    );

  }

  /// 갤러리에서 사진 가져오기
  void getFromGellary() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // 만약에 선택한 파일이 있다면 > null이 아니면
    if(pickedFile != null){
      print('=======================imagePath: ${imageFile!.path}');
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// 카메라로 찍어서 사진 가져오기
  void getFromCamera() async{
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if(pickedFile != null){
      print('=======================imagePath: ${imageFile!.path}');
      setState(() {
        imageFile = File(pickedFile.path);
        // 저장
        saveToGellary();
      });
    }
  }

  /// 갤러리에 저장하기 : GellarySaver
  Future<void> saveToGellary() async{
    await GallerySaver.saveImage(
      // 저장했던 파일 경로
      imageFile!.path,
      // albumName : '폴더명'
    );
    setState(() {});
  }

}
