import 'package:flutter/material.dart';
class ProfileButton extends StatelessWidget {
   ProfileButton({Key? key , required this.profilePhotoUrl}) : super(key: key);
String profilePhotoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            left: 5,
              child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image(
                image: NetworkImage("https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI="),//NetworkImage(profilePhotoUrl),

                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
