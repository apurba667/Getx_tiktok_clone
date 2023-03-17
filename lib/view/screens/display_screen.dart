import 'package:flutter/material.dart';
import 'package:tiktokclone/view/widgets/AlbumRotator.dart';
import 'package:tiktokclone/view/widgets/ProfileButton.dart';
import 'package:tiktokclone/view/widgets/TikTokVideoPlayer.dart';

class DisplayVideoScreen extends StatelessWidget {
  const DisplayVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                TikTokVideoPlayer(videoUrl: "aaa"),
                Container(
                  margin: EdgeInsets.only(bottom: 10,left: 15),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("@username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      Text("Caption is here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Song Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Container(
                    height: 350,
                    width: 100,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      ProfileButton(profilePhotoUrl: "ADD"),
                      const Column(children: [
                        Icon(Icons.favorite,color: Colors.white,size: 35,),
                        Text("Like",style: TextStyle(fontSize: 15,color: Colors.white),)
                      ],),
                      const Column(children: [
                        Icon(Icons.reply,color: Colors.white,size: 35,),
                        Text("Share",style: TextStyle(fontSize: 15,color: Colors.white),)
                      ],),
                       Column(children: [
                        Icon(Icons.comment,color: Colors.white,size: 35,),
                        Text("Comments",style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(height: 10,),
                        AlbumRotator(profilePicUrl: "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=")
                      ],),
                    ],),
                  ),
                ),
                Container(
                  width: 100,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                  ],),
                )
              ],
            );
          }),
    );
  }
}
