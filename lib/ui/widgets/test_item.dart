import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:flutterappdogandcat/ui/shared/argument_pass.dart';
import 'package:flutterappdogandcat/ui/views/start-exam/start_exam_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemTest extends StatelessWidget {
  final Example example;
  final String slug;

  const ItemTest(this.example, this.slug);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;

    return Container(
        child: GestureDetector(child: Card(
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
                              fontSize: 15 * width),maxLines: 2,overflow: TextOverflow.ellipsis),
                      SizedBox(height: 7),
                      Text("40 câu | 90 phút | Mã đề 142 | 2019 - 2020",
                        style: TextStyle(
                            color: Color.fromRGBO(108, 71, 144, 0.8),
                            fontWeight: FontWeight.normal,
                            fontSize: 15 * width),maxLines: 1,),
                      SizedBox(height: 7),
                      LinearPercentIndicator(
                        width: (MediaQuery.of(context).size.width - 30) * 0.8,
                        lineHeight: 14.0,
                        percent: 0,
                        animation: true,
                        center: Text(
                          "0/40",
                          style: TextStyle(fontSize: 12,color: Colors.black26),
                        ),
                        backgroundColor: Color.fromRGBO(211, 175, 173, 0.33),
                        progressColor: Color.fromRGBO(226, 100, 108, 1),
                      ),
                    ], crossAxisAlignment: CrossAxisAlignment.start)),
                Icon(
                  Icons.navigate_next,
                  size: 30,
                  color: Colors.black26,
                )
              ],
            ),
          ),
          elevation: 5,
        ),onTap: (){
          Navigator.of(context)
              .pushNamed(StartExamWidget.routerName, arguments: PassArgumentsScreen(slug, example));
        },),
        margin: EdgeInsets.all(2));
  }
}
