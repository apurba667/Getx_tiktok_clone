import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktokclone/constant.dart';
import 'package:tiktokclone/controller/upload_video_controller.dart';
import 'package:tiktokclone/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
class AddCaptionScreen extends StatefulWidget {
  AddCaptionScreen({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);
  File videoFile;
  String videoPath;

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  TextEditingController songNameController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  VideoUploadController videoUploadControlleer = Get.put(VideoUploadController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(videoPlayerController),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  TextInputField(
                      myIcon: Icons.music_note,
                      controller: songNameController,
                      myLabelText: "Song Name"),
                  SizedBox(height: 10,),
                  TextInputField(
                      myIcon: Icons.closed_caption,
                      controller: captionController,
                      myLabelText: "Enter Caption"),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    videoUploadControlleer.uploadVideo(songNameController.text, captionController.text, widget.videoPath);
                  }, child: Text("Upload"),style: ElevatedButton.styleFrom(primary: buttonColor))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
