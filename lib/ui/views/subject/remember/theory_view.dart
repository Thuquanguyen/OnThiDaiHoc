import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/items/item_common_post.dart';

import 'items/item_theory_all.dart';

class TheoryView extends StatelessWidget {
  static const routeName = '/theory-view';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 640;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16 * width,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Các kiến thức cần nhớ",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        titleSpacing: -15 * width,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(15 * width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kiến thức tổng quan",
                style: TextStyle(
                    fontSize: 18 * width,
                    fontWeight: FontWeight.bold,
                    color: colorFromHex("302CDE"))),
            SizedBox(height: 15),
            Container(child: Expanded(child: GridView.builder(
                shrinkWrap: false,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return ItemTheoryAll();
                },
                itemCount: 3),),height: 110 * height),
            Text("Các dạng bài thường gặp",
                style: TextStyle(
                    fontSize: 18 * width,
                    fontWeight: FontWeight.bold,
                    color: colorFromHex("302CDE"))),
            SizedBox(height: 15 * height),
            Expanded(child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  child: ItemCommonPost(),
                ),
                itemCount: 10))
          ],
        ),
      ),
    );
  }
}
