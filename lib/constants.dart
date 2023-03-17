import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tiktokclone/view/screens/add_video.dart';
import 'package:tiktokclone/view/screens/display_screen.dart';


// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  DisplayVideoScreen(),
 addVideoScreen(),
  Text('Coming Soon In New Updates!'),
];