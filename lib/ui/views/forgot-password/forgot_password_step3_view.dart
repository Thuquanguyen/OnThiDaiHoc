import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/shared/box_decoration.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/sign-in/login_view.dart';

class ForgotPasswordStep3View extends StatelessWidget {

  static const routeName = "/forgot-passwor3";

  final TextEditingController controllerPasswordNew = TextEditingController();
  final TextEditingController controllerPasswordRe = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Forgot Password",style: TextStyle(color: Colors.black)),
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
      body: Container(color: Colors.white,width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 40 * height),
        child: Column(children: <Widget>[
          Image.asset("assets/images/icon_forgot_pasword.png",fit: BoxFit.cover),
          SizedBox(height: 30 * height),
          ListTile(
            title: Text("Please enter a new password.",style: TextStyle(color: Colors.black,fontSize: 14 * width)),
          ),
          Container(
              height: 60 * height,
              decoration: borderBackground(backgroundColor, height),
              margin: EdgeInsets.only(left: 10 * width, right: 10 * width),
              child: Center(child: TextField(
                  controller: controllerPasswordNew,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "New Password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      prefixIcon: Icon(Icons.vpn_key))),)),
          SizedBox(height: 10 * height),
          Container(
              height: 60 * height,
              decoration: borderBackground(backgroundColor, height),
              margin: EdgeInsets.only(left: 10 * width, right: 10 * width),
              child: Center(child: TextField(
                  controller: controllerPasswordRe,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Re-enter Password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      prefixIcon: Icon(Icons.vpn_key))),)),
          SizedBox(height: 40 * height),
          GestureDetector(
              child: Container(
                  child: Center(
                      child: Text("Change Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20 * width))),
                  decoration: borderBackground(backgroundSignInColor, height),
                  width: MediaQuery.of(context).size.width,
                  height: 60 * height,
                  margin:
                  EdgeInsets.only(left: 10 * width, right: 10 * width)),
          onTap: (){
            Navigator.of(context).popAndPushNamed(LoginView.routeName);
          },)
        ],),),
    );
  }
}
