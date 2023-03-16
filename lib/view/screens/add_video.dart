import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/constant.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/view/screens/add_caption_screen.dart';
class AddVideoScreen extends StatefulWidget  {
  AddVideoScreen({Key? key}) : super(key: key);

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
 videoPick(ImageSource src , BuildContext context)async{
   final video = await ImagePicker().pickVideo(source: src);
   if(video != null){
     Get.snackbar("Video Selected", video.path);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCaptionScreen(videoFile: File(video.path), videoPath: video.path)));
   }
   else{
     Get.snackbar("Error in Selecting Video", "Please Choose a different video file");
   }
 }

 showDialogOpt(BuildContext context){
   return showDialog(context: context, builder: (context)=>
       SimpleDialog(
         children: [
           SimpleDialogOption(
             onPressed: ()=>videoPick(ImageSource.gallery , context),
             child: Text("Gallery"),
           ),
           SimpleDialogOption(
             onPressed: ()=>videoPick(ImageSource.camera , context),
             child: Text("Camera"),
           ),
           SimpleDialogOption(
             onPressed: (){
               Navigator.pop(context);
             },
             child: Text("Close"),
           )
         ],
       ));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
                child: Text(
              "Add Video",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
