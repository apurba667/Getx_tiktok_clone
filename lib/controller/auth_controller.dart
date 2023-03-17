import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/model/user.dart';
import 'package:tiktokclone/view/screens/auth/login_screen.dart';

import '../view/screens/Home.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  File? proImg;
  // image peaker
  pickImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final img = File(image.path);
    this.proImg = img;
  }



  // User registration
  void signUp(String username, String email, String password,
      File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);
        MyUser user = MyUser(uid: credential.user!.uid,
            email: email,
            name: username,
            profilePhoto: downloadUrl);
        await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set(user.toJson());
      }
      else{
        Get.snackbar("Error Creating Account", "Please Enter all the required fields");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProPic(image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profilePics")
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }


  //User Login
  void loginUser(String email, String password)async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      }
      else{
        Get.snackbar("Error Logging In", "Please Enter valid email and password");
      }
    }catch(e){
      Get.snackbar("Error Logging In", e.toString());
    }
  }
  //User State Persistence
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    //Rx - Observable Keyword - continuously check the value is changing or not !
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user,_setInitialView);
  }
  _setInitialView(User? user){
    if(user == null){
      Get.offAll(()=> LoginScreen());
    }
    else{
      Get.offAll(()=>HomeScreen());
    }
  }

}