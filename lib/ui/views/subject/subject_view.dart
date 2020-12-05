import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/inherited/question_inherited.dart';
import 'package:flutterappdogandcat/core/model/subject.dart';
import 'package:flutterappdogandcat/ui/widgets/subject_child_item.dart';

class SubjectView extends StatelessWidget {
  static const routeName = "/math-details";

  List<Subject> subjecs = <Subject>[
    Subject(
        slug: "bai_thi_trac_nghiem",
        image:
            "assets/images/detail/icon_thithu.png",
        cover_url:
            "assets/images/detail/bg_thithu.png",
        title: "Đề thi thử"),
    Subject(
        slug: "de_thi_thu",
        image:
            "assets/images/detail/icon_dethicacnam.png",
        cover_url:
            "assets/images/detail/bg_dethicacnam.png",
        title: "Đề thi các năm"),
    Subject(
        slug: "cac_kien_thuc_can_nho",
        image:
            "assets/images/detail/icon_kienthuc.png",
        cover_url:
            "assets/images/detail/bg_kienthuc.png",
        title: "Lý thuyết"),
    Subject(
        slug: "ghi_chu",
        image:
            "assets/images/detail/icon_ghichu.png",
        cover_url:
            "assets/images/detail/bg_ghichu.png",
        title: "Ghi chú")
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    Subject subjectModel = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          subjectModel.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: QuestionInherited(
          slug: subjectModel.slug,
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(15 * width),
              child: Center(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.45)),
                      itemBuilder: (_, index) =>
                          SubjectChild(subjectModel: subjecs[index]),
                      itemCount: subjecs.length)))),
    );
  }
}
