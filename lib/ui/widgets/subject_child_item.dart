import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/inherited/question_inherited.dart';
import 'package:flutterappdogandcat/core/model/subject.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/exam_years.dart';
import 'package:flutterappdogandcat/ui/views/subject/note_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_list.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_view.dart';
import 'package:flutterappdogandcat/ui/views/test/example_list_view.dart';
import 'package:flutterappdogandcat/ui/views/test/example_view.dart';

class SubjectChild extends StatelessWidget {

  final Subject subjectModel;

  SubjectChild({@required this.subjectModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;
    final slug = QuestionInherited
        .of(context)
        .slug;
    return GestureDetector(child: Container(width: 177 * width,height: 246 * height,
      margin: EdgeInsets.all(8 * width),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10 * width)),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(1, 48, 90, 0.15),blurRadius: 8 * width)
          ]),
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10 * width),
          child: Image.network(subjectModel.cover_url),
        ),
        Align(alignment: Alignment.bottomCenter,child:
        Container( height: 170 * height,decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20 * width),
            topRight: Radius.circular(20 * width),
            bottomLeft: Radius.circular(10 * width),
            bottomRight: Radius.circular(10 * width),
          ),),child:
        Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children:
        <Widget>[
          Container(width: 60 * width,height: 60 * width,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(image:
                NetworkImage(subjectModel.image),fit: BoxFit.cover)
            ),),
          SizedBox(height: 15 * height),
          Text(subjectModel.title,style: TextStyle(fontSize: 16 * width,color: Colors.black),)
        ]))))
      ])),
    onTap: (){
      switch (subjectModel.slug) {
        case 'bai_thi_trac_nghiem':
          Navigator.of(context).pushNamed(
              ExampleListView.routeName, arguments: slug);
          break;
        case "cac_kien_thuc_can_nho":
          Navigator.of(context).pushNamed(RememberListView.routeName, arguments: slug);
              break;
        case "ghi_chu":
          Navigator.of(context).pushNamed(NoteView.routeName, arguments: slug);
          break;
        case "de_thi_thu":
          Navigator.of(context).pushNamed(ExamYears.routeName,arguments: slug);
          break;
      }
    });
  }
}
