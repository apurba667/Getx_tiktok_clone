import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  MyUser(
      {required this.uid,
        required this.email,
        required this.name,
        required this.profilePhoto});

  //App - Firebase(map accept kore)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profilePic": profilePhoto,
      "email": email,
      "uid": uid
    };
  }

  //Firebase - app(User)
  static MyUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MyUser(
        uid: snapshot["uid"],
        email: snapshot['email'],
        name: snapshot["name"],
        profilePhoto: snapshot["profilePic"]);
  }
}