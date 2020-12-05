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
  var date = new DateTime.now();

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
    var prevMonth = new DateTime(date.year, date.month, date.day);
    var weekday = date.weekday;
    final width = MediaQuery.of(context).size.width / 375;
    final height = MediaQuery.of(context).size.height / 647;

    List<Subject> subjecs = <Subject>[
      Subject(
          slug: "toan",
          image: "assets/images/home/icon_toan.png",
          title: "Toán"),
      Subject(
          slug: "ly",
          image: "assets/images/home/icon_vatly.png",
          title: "Vật Lý"),
      Subject(
          slug: "hoa",
          image: "assets/images/home/icon_hoahoc.png",
          title: "Hoá Học"),
      Subject(
          slug: "van",
          image: "assets/images/home/icon_nguvan.png",
          title: "Ngữ Văn"),
      Subject(
          slug: "tanh",
          image: "assets/images/home/icon_tienganh.png",
          title: "Tiếng Anh"),
      Subject(
          slug: "sinh",
          image: "assets/images/home/icon_sinhhoc.png",
          title: "Sinh Học"),
      Subject(
          slug: "su",
          image: "assets/images/home/icon_lichsu.png",
          title: "Lịch Sử"),
      Subject(
          slug: "dia",
          image: "assets/images/home/icon_dialy.png",
          title: "Địa Lý"),
      Subject(
          slug: "giao_duc_cong_dan",
          image: "assets/images/home/icon_gdcd.png",
          title: "GDCD"),
    ];

    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              headerView(height),
              Container(
                height: 70 * height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    left: 24 * width, right: 24 * width, top: 122 * height),
                child: calendarView(width, height, convertWeek(weekday),
                    "${prevMonth.day}/${prevMonth.month}/${prevMonth.year}"),
              ),
            ]),
            collectionViewTab(subjecs)
          ],
        ));
  }

  Widget headerView(double height) => Container(
      padding: EdgeInsets.only(
          top: 60 * height, left: 25 * height, right: 20 * height),
      color: Color.fromRGBO(39, 65, 143, 1),
      height: 162 * height,
      width: MediaQuery.of(context).size.width,
      child: Row(
          children: [
            Column(children: [
              Image.asset("assets/images/home/icon_logo.png",
                  width: 35 * height, height: 37 * height),
              Text("study 4.0".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ]),
            SizedBox(width: 10 * height),
            Flexible(
                child: Column(children: [
              Text("Ôn thi THPT Quốc Gia Năm 2020 - 2021",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 0, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 11)),
              SizedBox(height: 4 * height),
              Text("ứng dụng ôn thi đại học".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 4 * height),
              Text("Học - Học Nữa - Học Mãi",
                  style: TextStyle(color: Colors.white, fontSize: 12))
            ], crossAxisAlignment: CrossAxisAlignment.start))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center));

  Widget calendarView(
          double width, double height, String weekDay, String dayMonthYear) =>
      Center(
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                      title: Row(children: <Widget>[
                        Icon(Icons.calendar_today_outlined,
                            color: Colors.red, size: 20),
                        SizedBox(width: 5 * width),
                        Text("$weekDay".toUpperCase(),
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14 * width))
                      ], mainAxisAlignment: MainAxisAlignment.center),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 5 * height),
                        child: Text("$dayMonthYear".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16 * width,
                                fontWeight: FontWeight.bold)),
                      ))),
              SizedBox(
                  width: 1,
                  height: 42 * height,
                  child: Container(color: Color.fromRGBO(241, 241, 241, 1))),
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
          elevation: 2
        ),
      );

  Widget collectionViewTab(List<Subject> subject) => Expanded(child: Container(
    color: Colors.white,
    child: GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),physics: ScrollPhysics(),
      itemBuilder: (context, index) =>
          Subjects(subjectModel: subject[index]),
      itemCount: subject.length,
    ),
  ));
}
