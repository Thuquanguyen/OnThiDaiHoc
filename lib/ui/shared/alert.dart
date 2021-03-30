import 'package:flutter/material.dart';

showAlert(BuildContext context, Function start, String title,
        String buttonTitle) =>
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            content: GestureDetector(
                child: Container(
                  child: Center(
                    child: Text(
                      buttonTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onTap: start),
          );
        });

showAlertSubmit(BuildContext context, int count,int lenght) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx){
      return AlertDialog(
        title: Column(
          children: <Widget>[
            Image.asset("assets/images/clock.png",fit: BoxFit.cover,),
            SizedBox(
              height: 5,
            ),
            Text(
              "Kết quả",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$count/$lenght câu đúng",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        content: GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  "OK",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      );
    });
