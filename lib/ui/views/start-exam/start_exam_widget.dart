import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/argument_pass.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_view.dart';
import 'package:flutterappdogandcat/ui/views/test/example_view.dart';

class StartExamWidget extends StatelessWidget {
  static const String routerName = '/start_exam';

  @override
  Widget build(BuildContext context) {
    PassArgumentsScreen example = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 640;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Column(children: [
            Text(example.content.title,
                style: TextStyle(
                    fontSize: 18 * width, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center),
            SizedBox(height: 5 * height),
            Text("Môn thi: ${getNameSlug(example.slug)}",
                style: TextStyle(
                    fontSize: 18 * width, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            SizedBox(height: 5 * height),
            Text("Mã đề ${example.content.code}",
                style: TextStyle(
                    fontSize: 18 * width, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            SizedBox(height: 5 * height),
            Text("(Đề thi không có đáp án)",
                style: TextStyle(fontSize: 16 * width, color: Colors.black45),
                textAlign: TextAlign.center),
            SizedBox(height: 30 * height),
            Icon(Icons.library_books,
                size: 50 * width, color: Color.fromARGB(102, 187, 106, 1)),
            SizedBox(height: 30 * height),
            Row(
              children: [
                Flexible(
                    child: Column(children: [
                  Row(
                    children: [
                      Icon(Icons.timer,
                          color: Color.fromARGB(102, 187, 106, 1)),
                      SizedBox(width: 8 * width),
                      Text("Thời gian")
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(height: 15 * height),
                  Text("90 phút",
                      style: TextStyle(
                          fontSize: 18 * width, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                ])),
                Flexible(
                    child: Column(children: [
                  Row(children: [
                    Icon(
                      Icons.question_answer,
                      color: Color.fromARGB(102, 187, 106, 1),
                    ),
                    SizedBox(width: 8 * width),
                    Text("Số câu hỏi")
                  ], mainAxisAlignment: MainAxisAlignment.center),
                  SizedBox(height: 15 * height),
                  Text("40 câu",
                      style: TextStyle(
                          fontSize: 18 * width, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                ]))
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SizedBox(height: 60 * height),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    (example.slug == TOAN ||
                            example.slug == VAT_LY ||
                            example.slug == HOA_HOC ||
                            example.slug == SINH_HOC)
                        ? RememberView.routeName
                        : ExampleView.routeName,
                    arguments:
                        PassArgumentsScreen(example.slug, example.content));
              },
              child: Text("Bắt đầu".toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              color: Color.fromARGB(231, 236, 171, 1),
            )
          ]),
          margin: EdgeInsets.only(
              right: 35 * width, left: 35 * width, top: 60 * height)),
    );
  }
}
