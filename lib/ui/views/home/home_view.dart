import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/subject.dart';
import 'package:flutterappdogandcat/core/viewmodel/check_update_model.dart';
import 'package:flutterappdogandcat/ui/shared/date_time.dart';
import 'package:flutterappdogandcat/ui/widgets/subject_item.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CheckupdateModel checkupdateModel = CheckupdateModel.instance;
  int dayCount = 0;

  @override
  void initState() {
    super.initState();
    checkupdateModel.getVersionApp().then((value) {
      setState(() {
        dayCount = value.results.dualDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now();
    var prevMonth = new DateTime(date.year, date.month, date.day);
    var weekday = date.weekday;
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;

    print("Thu : ${weekday}");
    List<Subject> subjecs = <Subject>[
      Subject(
          slug: "toan",
          image:
              "https://toppng.com/uploads/preview/calculator-icon-math-icon-11563227565ddgk3sskht.png",
          title: "Toán"),
      Subject(
          slug: "ly",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRvczepklo5y55MxjJitXxP6HmlCnTT6PCnIM3cRkKpemmE_Kpr&usqp=CAU",
          title: "Vật Lý"),
      Subject(
          slug: "hoa",
          image:
              "https://www.kindpng.com/picc/m/154-1546828_transparent-chemistry-icon-png-chemical-effects-of-electric.png",
          title: "Hoá Học"),
      Subject(
          slug: "van",
          image:
              "https://pluspng.com/img-png/english-subject-png-clipart-info-521.png",
          title: "Ngữ Văn"),
      Subject(
          slug: "tanh",
          image:
              "https://cdn0.iconfinder.com/data/icons/online-education-butterscotch-vol-2/512/Language_Learning-512.png",
          title: "Tiếng Anh"),
      Subject(
          slug: "sinh",
          image: "http://getdrawings.com/free-icon/school-subject-icons-61.png",
          title: "Sinh Học"),
      Subject(
          slug: "su",
          image:
              "https://c7.uihere.com/files/845/333/159/computer-icons-history-symbol-subject-clip-art-symbol.jpg",
          title: "Lịch Sử"),
      Subject(
          slug: "dia",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTY27EPIlgxJsiV5LCW0dejzC4h0arwdorW2dFHVxdEey6ZgI63&usqp=CAU",
          title: "Địa Lý"),
      Subject(
          slug: "giao_duc_cong_dan",
          image:
              "https://banner2.cleanpng.com/20180427/xcq/kisspng-sme-subject-matter-expert-computer-icons-5ae3340ed767c7.0268417915248394388823.jpg",
          title: "GDCD"),
    ];

    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset("assets/images/bg_header.gif",
                  fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
              Container(
                height: 120 * height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    left: 24 * width, right: 24 * width, top: 150 * height),
                child: Center(
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                                title: Row(children: <Widget>[
                                  Icon(Icons.calendar_today,
                                      color: Colors.red, size: 20),
                                  SizedBox(width: 5 * width),
                                  Text("${convertWeek(weekday)}".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14 * width))
                                ], mainAxisAlignment: MainAxisAlignment.center),
                                subtitle: Container(
                                  margin: EdgeInsets.only(top: 5 * height),
                                  child: Text(
                                      "${prevMonth.day}/${prevMonth.month}/${prevMonth.year}"
                                          .toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16 * width,
                                          fontWeight: FontWeight.bold)),
                                ))),
                        Expanded(
                            child: ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Icon(Icons.av_timer, color: Colors.red),
                                    SizedBox(width: 5 * width),
                                    Text("Còn lại".toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14 * width))
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                subtitle: Container(
                                  margin: EdgeInsets.only(top: 5 * height),
                                  child: Text("${dayCount} ngày".toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16 * width,
                                          fontWeight: FontWeight.bold)),
                                )))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    color: Colors.white,
                    elevation: 0.6,
                  ),
                ),
              ),
            ]),
            Expanded(
                child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) =>
                    Subjects(subjectModel: subjecs[index]),
                itemCount: subjecs.length,
              ),
            ))
          ],
        ));
  }
}
