import 'dart:io';
import 'dart:ui';

import 'package:app_two/toSell.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class sells extends StatefulWidget {
  const sells({Key? key}) : super(key: key);

  @override
  State<sells> createState() => _sellsState();
}

class _sellsState extends State<sells> {
  String? imagePath;
  File? image;
  late List<CameraDescription>cameras;
  late CameraController cameraController;

  int direction =0;

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  void startCamera(int direction) async{
    cameras = await availableCameras();
    cameraController = CameraController(
        cameras[direction],
        ResolutionPreset.high,
        enableAudio: false
    );
    await cameraController.initialize().then((value) {
      if(!mounted){
        return;
      }
      setState(() {});
    }).catchError((e){
      print(e);
    });

    @override
    void dispose(){
      cameraController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(cameraController.value.isInitialized){
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(cameraController),
            GestureDetector(
              onTap: (){
                setState(() {
                  direction = direction == 0? 1 : 0;
                  startCamera(direction);
                });
              },
              child:button(Icons.flip_camera_ios_outlined, Alignment.topLeft),
            ),
            GestureDetector(
              onTap: (){
                pickImageCamera();
                cameraController.setFlashMode(FlashMode.off);
                cameraController.takePicture().then((XFile? file){
                });
              },
              child:button(Icons.camera_alt_outlined, Alignment.bottomCenter),
            ),
            GestureDetector(
              onTap: (){
                cameraController.setFlashMode(FlashMode.always);
              },
              child:button(Icons.flash_on, Alignment.bottomRight),
            ),
            GestureDetector(
              onTap: () => pickImage(),
              child:button(Icons.camera_front, Alignment.bottomLeft),
            ),
          ],
        ),
      );
    }else{
      return const SizedBox();
    }
  }

  Future pickImage() async {
    final XFile? imagePath = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePath == null) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => toSell(
          // Pass the automatically generated path to
          // the DisplayPictureScreen widget.
          imagePath: imagePath.path,
        ),
      ),
    );

  }

  Future pickImageCamera() async {
    final XFile? imagePath = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePath == null) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => toSell(
          // Pass the automatically generated path to
          // the DisplayPictureScreen widget.
          imagePath: imagePath.path,
        ),
      ),
    );
  }




  Widget button(IconData icon, Alignment alignment){
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2,2),
                blurRadius: 10,
              )
            ]
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}


