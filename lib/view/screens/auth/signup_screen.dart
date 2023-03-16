import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktokclone/controller/auth_controller.dart';
import 'package:tiktokclone/view/screens/auth/login_screen.dart';
import 'package:tiktokclone/view/widgets/glitch.dart';
import 'package:tiktokclone/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              GlithEffect(child: const Text("Welcome To Tiktok",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),)),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://st3.depositphotos.com/1767687/16607/v/450/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg"),
                      radius: 60,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.edit,size: 30,),
                            )))
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    myIcon: Icons.email,
                    controller: _emailController,
                    myLabelText: "Enter Your Email"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    myIcon: Icons.lock,
                    controller: _passwordController,
                    toHide: true,
                    myLabelText: "Set Password"),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    myIcon: Icons.lock,
                    controller: _confirmPasswordController,
                    toHide: true,
                    myLabelText: "Confirm Password"),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    myIcon: Icons.person,
                    controller: _userController,
                    myLabelText: "Enter User Name"),
              ),
              ElevatedButton(onPressed: (){
                AuthController.instance.signUp(_userController.text, _emailController.text, _passwordController.text, AuthController.instance.proImg);
              }, child: Text("Sign up")),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: ElevatedButton(onPressed: (){
                  Get.offAll(()=>LoginScreen());
                }, child: Text("Sign In?")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
