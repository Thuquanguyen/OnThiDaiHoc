import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class ItemExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 640;
    return Container(
      margin: EdgeInsets.only(bottom: 15 * height),
      child: Row(
        children: [
          Image(image: AssetImage("assets/images/detail/img_example.png")),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mã đề 111", style: TextStyle(color: Colors.black)),
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
    );
  }
}
