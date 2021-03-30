import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/shared/box_decoration.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class RegisterView extends StatelessWidget {

  static const routeName = '/register';
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerPhoneNumber = TextEditingController();
  final TextEditingController controllerInvitationCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
      body: Container(color: Colors.white,width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 100 * height),
          child: Stack(children: <Widget>[
            Column(children: <Widget>[
              customRichText(context),
              SizedBox(height: 40 * height),
              Container(child: Row(children: <Widget>[
                Expanded(child: Container(
                    height: 60 * height,
                    padding: EdgeInsets.only(left: 10 * width),
                    decoration: borderBackground(backgroundColor, height),
                    child: Center(child: TextField(
                        controller: controllerFirstName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "First Name",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none)),))),
                SizedBox(width: 10 * width),
                Expanded(child: Container(
                    height: 60 * height,
                    padding: EdgeInsets.only(left: 10 * width),
                    decoration: borderBackground(backgroundColor, height),
                    child: Center(child: TextField(
                        controller: controllerLastName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Last Name",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none)),)))
              ],),margin: EdgeInsets.only(left: 20 * width, right: 20 * width)),
              SizedBox(height: 10 * height),
              Container(
                  height: 60 * height,
                  decoration: borderBackground(backgroundColor, height),
                  margin: EdgeInsets.only(left: 20 * width, right: 20 * width),
                  child: Center(child: TextField(
                      controller: controllerPhoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.phone))),)),
              SizedBox(height: 10 * height),
              Container(
                  height: 60 * height,
                  decoration: borderBackground(backgroundColor, height),
                  margin: EdgeInsets.only(left: 20 * width, right: 20 * width),
                  child: Center(child:
                  TextField(
                      controller: controllerInvitationCode,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Invitation Code",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.code))),)),
              SizedBox(height: 5 * height),
              Container(child: Row(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                Icon(Icons.info_outline),
                SizedBox(width: 5 * width),
                Text("Leave empty if you don't have Invitation Code",style: TextStyle(fontSize: 12 * width))
              ],),margin: EdgeInsets.only(left: 20 * width, right: 20 * width)),
              SizedBox(height: 40 * height),
              GestureDetector(
                  child: Container(
                      child: Center(
                          child: Text("Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20 * width))),
                      decoration: borderBackground(
                          backgroundSignInColor, height),
                      width: MediaQuery.of(context).size.width,
                      height: 60 * height,
                      margin:
                      EdgeInsets.only(left: 20 * width, right: 20 * width)))
            ],mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.black,fontSize: 16 * width),
                        children: <TextSpan>[
                          TextSpan(text: "Sign In", style: TextStyle(color: Colors.red,fontSize: 16 * width),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).pop())
                        ])),
              ),
              margin: EdgeInsets.all(30 * height),
            )
          ],)),
    );
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
