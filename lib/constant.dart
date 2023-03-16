import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktokclone/view/screens/add_video.dart';

// Colors

const backgroundColor = Colors.black;
var buttonColor = Colors.red;
const borderColor = Colors.grey;

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

var pageIndex = [
  Text('Home'),
  Text("Search",),
  AddVideoScreen(),
  Text( "message",),
  Text("Profile",),





];
