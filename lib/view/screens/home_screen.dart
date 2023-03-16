import 'package:flutter/material.dart';
import 'package:tiktokclone/constant.dart';
import 'package:tiktokclone/view/widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        currentIndex: pageIdx,
        onTap: (index){
        setState(() {
          pageIdx = index;
        });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 20),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 20),label: "Search"),
          BottomNavigationBarItem(icon: CustomAddIcon(),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message,size: 20),label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 20),label: "Profile"),
        ],
      ),
      body: Center(
        child:pageIndex[pageIdx],
      ),
    );
  }
}
