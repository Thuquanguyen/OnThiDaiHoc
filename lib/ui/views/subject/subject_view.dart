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
            "https://www.pikpng.com/pngl/m/181-1812750_maths-subject-png-maths-icon-transparent-clipart.png",
        cover_url:
            "https://previews.123rf.com/images/lenm/lenm1509/lenm150900073/44775547-background-illustration-of-a-pile-of-graded-test-papers.jpg",
        title: "Đề thi thử"),
    Subject(
        slug: "de_thi_thu",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRvczepklo5y55MxjJitXxP6HmlCnTT6PCnIM3cRkKpemmE_Kpr&usqp=CAU",
        cover_url:
            "https://previews.123rf.com/images/lenm/lenm1509/lenm150900073/44775547-background-illustration-of-a-pile-of-graded-test-papers.jpg",
        title: "Đề thi các năm"),
    Subject(
        slug: "cac_kien_thuc_can_nho",
        image:
            "https://www.kindpng.com/picc/m/154-1546828_transparent-chemistry-icon-png-chemical-effects-of-electric.png",
        cover_url:
            "https://cdn3.vectorstock.com/i/1000x1000/80/97/education-open-book-knowledge-icons-background-vec-vector-20918097.jpg",
        title: "Các kiến thức cần nhớ"),
    Subject(
        slug: "ghi_chu",
        image:
            "https://pluspng.com/img-png/english-subject-png-clipart-info-521.png",
        cover_url:
            "https://media.istockphoto.com/photos/colorful-sticky-notes-seamless-background-picture-id471206670?k=6&m=471206670&s=612x612&w=0&h=PTj2e2-rG7kL9FnlMT61JWR08CBhiYITB1tUKzgJpuc=",
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
                          childAspectRatio: MediaQuery
                              .of(context)
                              .size
                              .width /
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .height / 1.45)),
                      itemBuilder: (_, index) =>
                          SubjectChild(subjectModel: subjecs[index]),
                      itemCount: subjecs.length)))),
    );
  }
}
