import 'package:flutter/material.dart';

class ListCodeExam extends StatefulWidget {
  static const String routeName = '/lits_code_exam';

  @override
  _ListCodeExamState createState() => _ListCodeExamState();
}

class _ListCodeExamState extends State<ListCodeExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("Danh sách mã đề"),
      ),
      body: Container(
          margin: EdgeInsets.all(5),
          child: ListView.builder(
              itemBuilder: (context, data) {
                return Card(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: Center(
                                child: Text("Mã đề 365",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)))),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              ListTile(
                                  title:
                                      Text("Đề thi môn Toán tốt nghiệp THPT"),
                                  subtitle:
                                      Text("Thời gian làm bài : 90 phút")),
                              Container(
                                child: Text(
                                  "Submitted",
                                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(right: 10),
                              ),
                              SizedBox(height: 5)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10)),
    );
  }
}
