import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:flutterappdogandcat/core/viewmodel/example_model.dart';
import 'package:flutterappdogandcat/ui/shared/argument_pass.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/list_code_exam.dart';

class ExamYears extends StatefulWidget {
  static const String routeName = "/exam_year";

  @override
  _ExamYearsState createState() => _ExamYearsState();
}

class _ExamYearsState extends State<ExamYears> {

  PageController pageController =
      PageController(initialPage: 2048, keepPage: true, viewportFraction: 0.8);
  ExampleModel model = ExampleModel.instance;

  @override
  Widget build(BuildContext context) {

    String slug = ModalRoute.of(context).settings.arguments;
    model.getListExample(slug);
    final width = MediaQuery.of(context).size.width / 360;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text("Đề thi các năm"),
        ),
        body: StreamBuilder<List<Example>>(
          stream: model.exampleStream,
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Container(child: Center(child: CupertinoActivityIndicator()));
            }else if (snapshot.error != null){
              return Container(child: Center(child: Text("Đã có lỗi xảy ra vui lòng thử lại!")));
            }else{
              return  Container(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return itemPage(index,width,slug,snapshot.data);
                  },
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                ),
                margin: EdgeInsets.only(bottom: 10),
              );
            }
          },
        ));
  }

  // ignore: non_constant_identifier_names
  Widget itemPage(var index,double width,String slug,List<Example> data) => Container(

        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                child: Card(
                  child: Stack(children: [
                    Image(image: AssetImage("assets/images/detail/bg_paper.png"),fit: BoxFit.cover,width: 400 * width,),
                    Container(
                        child: Column(
                          children: [
                            Text(
                                "Đề thi môn Toán tốt nghiệp THPT ${2016 + index + 1}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.center),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Text("Thời gian làm bài: 90 phút",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 10),
                                Text("Đã hoàn thành: 10/20 Mã đề",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            SizedBox(height: 40),
                            Container(
                                child: GestureDetector(
                                  child: Text("Làm bài",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(ListCodeExam.routeName,arguments: PassArgumentsScreen(slug,data));
                                  },
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10))
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: 50, left: 10, right: 10, bottom: 20))
                  ],),
                  elevation: 5,
                ),
                margin: EdgeInsets.only(top: 16),
              ),

              Container(
                child: Text("${2016 + index + 1}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18)),
                decoration: BoxDecoration(
                    color: Colors.lightBlue, shape: BoxShape.circle),
                padding: EdgeInsets.all(15),
              ),
            ],
            alignment: AlignmentDirectional.topCenter,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(ListCodeExam.routeName,arguments: PassArgumentsScreen(slug,data));
          },
        ),
        padding: EdgeInsets.all(10),
      );
}
