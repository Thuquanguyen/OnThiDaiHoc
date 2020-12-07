import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemTest extends StatelessWidget {
  final Example example;

  const ItemTest(this.example);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                    child: Column(children: [
                  Text(example.title,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  SizedBox(height: 7),
                  Text("40 câu | 90 phút | Mã đề 142 | 2019 - 2020",
                      style: TextStyle(
                          color: Color.fromRGBO(108, 71, 144, 0.8),
                          fontWeight: FontWeight.normal,
                          fontSize: 15),maxLines: 1,),
                  SizedBox(height: 7),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.8,
                    lineHeight: 14.0,
                    percent: 0.4,
                    animation: true,
                    center: Text(
                      "15/40",
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Color.fromRGBO(211, 175, 173, 0.33),
                    progressColor: Color.fromRGBO(226, 100, 108, 1),
                  ),
                ], crossAxisAlignment: CrossAxisAlignment.start)),
                Icon(
                  Icons.navigate_next,
                  size: 30,
                )
              ],
            ),
          ),
          elevation: 5,
        ),
        margin: EdgeInsets.all(2));
  }
}
