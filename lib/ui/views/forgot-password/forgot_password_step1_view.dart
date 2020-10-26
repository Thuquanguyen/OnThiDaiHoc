import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/shared/box_decoration.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/forgot-password/forgot_password_step2_view.dart';

class ForgotPasswordStep1View extends StatelessWidget {
  
  static const routeName = "/forgot-password-1";

  final TextEditingController controllerPhoneNumber = TextEditingController();
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
          SizedBox(height: 50 * height),
          ListTile(
            title: Text("Please enter your registered PhoneNumber ID.",style: TextStyle(color: Colors.black,fontSize: 14 * width)),
            subtitle: Container(margin: EdgeInsets.only(top: 5 * height),
              child: Text("We will send a verification code to your registerd\nphone number ID",
                  style: TextStyle(fontSize: 13 * width)),),
          ),
          SizedBox(height: 30 * height),
          Container(
              height: 60 * height,
              decoration: borderBackground(backgroundColor, height),
              margin: EdgeInsets.only(left: 10 * width, right: 10 * width),
              child: Center(child:
              TextField(
                  controller: controllerPhoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.phone))),)),
          SizedBox(height: 40 * height),
          GestureDetector(
              child: Container(
                  child: Center(
                      child: Text("Next",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20 * width))),
                  decoration: borderBackground(backgroundSignInColor, height),
                  width: MediaQuery.of(context).size.width,
                  height: 60 * height,
                  margin:
                  EdgeInsets.only(left: 10 * width, right: 10 * width)),
          onTap: (){
            Navigator.of(context).pushNamed(ForgotPasswordStep2View.routeName);
          },)
        ],),),
    );
  }
}
