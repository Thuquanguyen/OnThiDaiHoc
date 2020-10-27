import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/shared/box_decoration.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'forgot_password_step3_view.dart';

class ForgotPasswordStep2View extends StatefulWidget {

  static const routeName = "/forgot-password-2";

  @override
  _ForgotPasswordStep2State createState() => _ForgotPasswordStep2State();
}

class _ForgotPasswordStep2State extends State<ForgotPasswordStep2View> {
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
          Image.asset("assets/images/icon_forgot_step2.png",fit: BoxFit.cover,width: 250,height: 250,),
          SizedBox(height: 20 * height),
          ListTile(
            title: Text("Please enter your the Verification Code.",style: TextStyle(color: Colors.black,fontSize: 14 * width)),
            subtitle: Container(margin: EdgeInsets.only(top: 5 * height),
              child: Text("We have sent a verification code to your registered\nphone number ID.",
                  style: TextStyle(fontSize: 13 * width)),),
          ),
          SizedBox(height: 30 * height),
         // Container(child:  Align(alignment: Alignment.centerLeft,child: VerificationCode(
         //   textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
         //   autofocus: true,
         //   keyboardType: TextInputType.number,
         //   itemDecoration: borderBackground(backgroundColor, height),
         //   length: 4,
         //   onCompleted: (String value) {
         //   },
         //   onEditing: (bool value) {
         //     setState(() {
         //     });
         //   },
         // ),),margin: EdgeInsets.only(left: 10 * width),),
          SizedBox(height: 40 * height),
          GestureDetector(
              child: Container(
                  child: Center(
                      child: Text("Done",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20 * width))),
                  decoration: borderBackground(backgroundSignInColor, height),
                  width: MediaQuery.of(context).size.width,
                  height: 60 * height,
                  margin:
                  EdgeInsets.only(left: 10 * width, right: 10 * width)),
            onTap: (){
              Navigator.of(context).pushNamed(
                  ForgotPasswordStep3View.routeName);
            },)
        ],),),
    );
  }
}
