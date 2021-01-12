import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/argument_pass.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/items/item_example.dart';

class ListCodeExam extends StatefulWidget {
  static const String routeName = '/lits_code_exam';

  @override
  _ListCodeExamState createState() => _ListCodeExamState();
}

class _ListCodeExamState extends State<ListCodeExam> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 640;
    PassArgumentsScreen arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: colorFromHex("63B9F5"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorFromHex("63B9F5"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 15 * height),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: [
          Padding(padding: EdgeInsets.all(15 * width),child: GestureDetector(
            child: Text(
              "Tải về",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              print("donwload ");
            },
          ),)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 15 * width,
                right: 15 * width,
                top: 10 * height,
                bottom: 35 * height),
            child: Text(
              "Đề thi môn Toán tốt nghiệp THPT năm 2020 \nTổng cộng 15 mã đề",
              style: TextStyle(color: Colors.white, fontSize: 13 * width),
            ),
          ),
          Expanded(
              child: Container(
                  // margin: EdgeInsets.only(),
                  padding: EdgeInsets.only(top: 35 * height,left: 15 * width, right: 15 * width),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20 * width),
                          topRight: Radius.circular(20 * width))),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ItemExample(example: arguments.content[index],slug: arguments.slug);
                      },
                      itemCount: arguments.content.length)))
        ],
      ),
    );
  }
}
