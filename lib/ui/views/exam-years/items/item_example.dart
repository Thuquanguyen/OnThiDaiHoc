import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:flutterappdogandcat/ui/shared/argument_pass.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/test/example_view.dart';

class ItemExample extends StatelessWidget {

  final Example example;
  final String slug;

  const ItemExample({Key key, this.example, this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height / 640;

    return GestureDetector(child: Container(
      margin: EdgeInsets.only(bottom: 15 * height),
      child: Row(
        children: [
          Image(image: AssetImage("assets/images/detail/img_example.png")),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mã đề ${example.code}", style: TextStyle(color: Colors.black)),
                  SizedBox(height: 3 * height),
                  Text("Tổng số câu 40",
                      style: TextStyle(color: colorFromHex("A8A8A8"))),
                  SizedBox(height: 3 * height),
                  Text("Tổng thời gian 90 phút",
                      style: TextStyle(color: colorFromHex("A8A8A8"))),
                ],
              )),
          Icon(Icons.navigate_next, color: Colors.black)
        ],
      ),
    ),onTap: (){
      Navigator.of(context)
          .pushNamed(ExampleView.routeName, arguments: PassArgumentsScreen(slug,example));
    },);
  }
}
