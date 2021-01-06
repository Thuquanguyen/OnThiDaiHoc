import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/inherited/question_inherited.dart';
import 'package:flutterappdogandcat/core/model/subject.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/exam_years.dart';
import 'package:flutterappdogandcat/ui/views/subject/note_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/web_example_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/theory_view.dart';
import 'package:flutterappdogandcat/ui/views/test/example_list_view.dart';
import 'package:flutterappdogandcat/ui/views/test/example_view.dart';

class SubjectChild extends StatelessWidget {
  final Subject subjectModel;
  final int index;

  SubjectChild({@required this.subjectModel,@required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 640;
    final slug = QuestionInherited.of(context).slug;

    return GestureDetector(
        child: Container(
            width: 136 * width,
            height: 187 * height,
            margin: EdgeInsets.all(8 * width),
            child: Card(
              child: Stack(children: <Widget>[
                Align(child: Container(child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10 * width),
                    topRight: Radius.circular(10 * width),
                  ),
                  child: Image(image: AssetImage(subjectModel.cover_url)),
                ),margin: EdgeInsets
                  .only(top: index == 2 ? (15 * height) : 0),),alignment: Alignment.topCenter),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 90 * height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20 * width),
                            topRight: Radius.circular(20 * width),
                            bottomLeft: Radius.circular(10 * width),
                            bottomRight: Radius.circular(10 * width),
                          ),
                        ),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                              Container(
                                width: 50 * width,
                                height: 50 * width,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(39, 65, 143, 1),
                                    shape: BoxShape.circle),
                                child: Image(
                                    image: AssetImage(subjectModel.image)),
                              ),
                              SizedBox(height: 5 * height),
                              Text(
                                subjectModel.title,
                                style: TextStyle(
                                    fontSize: 16 * width, color: Colors.black),
                              )
                            ]))))
              ]),
              elevation: 5,
            )),
        onTap: () {
          switch (subjectModel.slug) {
            case 'bai_thi_trac_nghiem':
              Navigator.of(context)
                  .pushNamed(ExampleListView.routeName, arguments: slug);
              break;
            case "de_cac_nam":
              Navigator.of(context)
                  .pushNamed(ExamYears.routeName, arguments: slug);
              break;
            case "cac_kien_thuc_can_nho":
              Navigator.of(context)
                  .pushNamed(TheoryView.routeName, arguments: slug);
              break;
            case "ghi_chu":
              Navigator.of(context)
                  .pushNamed(NoteView.routeName, arguments: slug);
              break;

          }
        });
  }
}
