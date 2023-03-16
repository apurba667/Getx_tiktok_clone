import 'package:flutter/material.dart';
import 'package:tiktokclone/controller/auth_controller.dart';
import 'package:tiktokclone/view/screens/auth/signup_screen.dart';
import 'package:tiktokclone/view/widgets/glitch.dart';
import 'package:tiktokclone/view/widgets/text_input.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(child: const Text("Tiktok clone",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),)),
            SizedBox(
              height: 20,
            ),
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
                  myLabelText: "Enter Your Password"),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              AuthController.instance.loginUser(_emailController.text, _passwordController.text);
            }, child: Text("Login")),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: ElevatedButton(onPressed: (){
                Get.offAll(()=>SignupScreen());
              }, child: Text("Sign Up?")),
            ),
          ],
        ),
      ),
    );
  }
}
