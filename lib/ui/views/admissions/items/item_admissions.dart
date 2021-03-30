import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class ItemAdmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 640;

    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: colorFromHex("C4C4C4"),width: 1))),
      padding: EdgeInsets.only(left: 15 * width,right: 15 * width),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school_outlined),
          SizedBox(width: 10 * width),
          Expanded(
              child: Column(
            children: [
              Text(
                "Kiến nghị về việc: Cấp thẻ tạm trú cho người nước ngoài",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14 * width),
              ),
              SizedBox(height: 5 * height),
              Row(
                children: [
                  Icon(Icons.remove_red_eye_outlined,size: 17 * width,color: colorFromHex("A4A6A8"),),
                  SizedBox(width: 5 * width),
                  Text("215 đã xem",style: TextStyle(fontSize: 10 * width,color: colorFromHex("A4A6A8"))),
                  SizedBox(width: 10 * width),
                  Icon(Icons.favorite_border,size: 17 * width,color: colorFromHex("A4A6A8")),
                  SizedBox(width: 5 * width),
                  Text("1K lượt thích",style: TextStyle(fontSize: 10 * width,color: colorFromHex("A4A6A8")))
                ],
              ),
              SizedBox(height: 5 * height),
              Divider(height: 1, color: colorFromHex("DBDBDB")),
              SizedBox(height: 5 * height),
              Text("Hướng dẫn thủ tục dành cho người nước ngoài và người Việt Nam mang hộ chiếu nước ngoài.... Xem thêm"),
              SizedBox(height: 10 * height)
            ],
          ))
        ],
      ),
    );
  }
}
