import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterappdogandcat/core/model/example.dart';

class ItemTest extends StatelessWidget {
  final Example example;

  const ItemTest(this.example);

  @override
  Widget build(BuildContext context) {
    return Container(child: Card(child: Container(padding: EdgeInsets.all(5),child: Row(
      children: [
        Image.asset("assets/images/icon_exam.png",width: 50,height: 50,),
        SizedBox(width: 10),
        Flexible(child: Column(children: [
          Text("Đề thi thử đại học",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Html(data: example.title),
          // Text(example.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal)),
          SizedBox(height: 5),
          Text("Submited",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold))
        ],crossAxisAlignment: CrossAxisAlignment.start))
      ],
    ),),),margin: EdgeInsets.all(2));
  }
}
