import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/shared/box_decoration.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/forgot-password/forgot_password_step1_view.dart';
import 'package:flutterappdogandcat/ui/views/intro/intro_view.dart';
import 'package:flutterappdogandcat/ui/views/navigation_bottom.dart';
import 'package:flutterappdogandcat/ui/views/sign-up/register_view.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login';
  final controllerPhone = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            customRichText(context),
            SizedBox(height: 50 * height),
            Container(
                height: 60 * height,
                decoration: borderBackground(backgroundColor, height),
                margin: EdgeInsets.only(left: 20 * width, right: 20 * width),
                child: Center(child: TextField(
                    controller: controllerPhone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.phone))),)),
            SizedBox(height: 20 * height),
            Container(
                height: 60 * height,
                decoration: borderBackground(backgroundColor, height),
                margin: EdgeInsets.only(left: 20 * width, right: 20 * width),
                child: Center(child: TextField(
                    controller: controllerPassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: Icon(Icons.remove_red_eye),
                        prefixIcon: Icon(Icons.lock_outline))),)),
            SizedBox(height: 20 * height),
            Container(
              child: GestureDetector(child: Text("Forgot your password?",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.right),onTap: (){
                Navigator.of(context).pushNamed(
                    ForgotPasswordStep1View.routeName);
              },),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 20 * width),
            ),
            SizedBox(height: 20 * height),
            GestureDetector(
                child: Container(
                    child: Center(
                        child: Text("Sign In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: 20 * width))),
                    decoration: borderBackground(backgroundSignInColor, height),
                    width: MediaQuery.of(context).size.width,
                    height: 60 * height,
                    margin:
                        EdgeInsets.only(left: 20 * width, right: 20 * width)),onTap: (){
                Navigator.of(context).popAndPushNamed(IntroView.routeName);
              },)
          ],
        ),
        Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
                text: TextSpan(
                    text: "Dont't have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(text: "Sign Up", style: TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Navigator.of(context).pushNamed(
                                RegisterView.routeName))
                ])),
          ),
          margin: EdgeInsets.all(20 * height),
        )
      ],
    ));
  }

  Widget customRichText(BuildContext context) => RichText(
          text: TextSpan(
              text: "",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
            TextSpan(
                text: "D",
                style: TextStyle(
                    color: Colors.red, decoration: TextDecoration.none)),
            TextSpan(
                text: "O",
                style: TextStyle(
                    color: Colors.cyan, decoration: TextDecoration.none,fontSize: 40)),
            TextSpan(
                text: "G",
                style: TextStyle(
                    color: Colors.purple, decoration: TextDecoration.none)),
            TextSpan(
                text: "&",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    decoration: TextDecoration.none)),
            TextSpan(
                text: "C",
                style: TextStyle(
                    color: Colors.brown, decoration: TextDecoration.none)),
            TextSpan(
                text: "A",
                style: TextStyle(
                    color: Colors.red, decoration: TextDecoration.none,fontSize: 40)),
            TextSpan(
                text: "T",
                style: TextStyle(
                    color: Colors.amberAccent,
                    decoration: TextDecoration.none)),
          ]));


}
