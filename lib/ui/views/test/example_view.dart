import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/viewmodel/count_model.dart';
import 'package:flutterappdogandcat/core/viewmodel/question_model.dart';
import 'package:flutterappdogandcat/ui/shared/alert.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/widgets/request_default_item.dart';
import 'package:flutterappdogandcat/ui/widgets/request_default_vanhoc_item.dart';
import 'package:flutterappdogandcat/ui/widgets/request_item.dart';
import 'package:provider/provider.dart';

class PomodoroTimer extends AnimatedWidget {
  PomodoroTimer({this.timeRemainingInSeconds})
      : super(listenable: timeRemainingInSeconds);

  Animation<int> timeRemainingInSeconds;

  Widget build(BuildContext context) {
    String minutes = '${(timeRemainingInSeconds.value / 60).floor()}';
    String seconds = '${(timeRemainingInSeconds.value % 60)}'.padLeft(2, '0');
    return new Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 18),
    );
  }
}

class ExampleView extends StatefulWidget {
  static const routeName = '/test';

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<ExampleView>
    with TickerProviderStateMixin {
  QuestionModel _subjectViewModel = QuestionModel.instance;
  AnimationController _controller;
  var index;
  var check = 0;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showAlert(context, () {
      Navigator.pop(context);
      _controller.forward(from: 0.0);
    }, "Bắt đầu làm bài thi", "Bắt đầu");
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context).settings.arguments;
    _subjectViewModel.getListSubject(data['slug'], data['id']).then((value) {
      if (value.length != 0 && data['slug'] != "van") {
        _showDialog();
      }
    });
    final time = data['slug'] == "toan"
        ? 90
        : (data['slug'] == "van" ? 120 : (data['slug'] == "tanh" ? 60 : 50));
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(minutes: time),
    );
    final width = MediaQuery.of(context).size.width / 414;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountModel()),
        ],
        child: StreamBuilder<List<Question>>(
          stream: _subjectViewModel.subjectStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: Scaffold(
                    body: Center(child: CupertinoActivityIndicator()),
                  ));
            } else if (snapshot.error != null) {
              return Scaffold(
                  body: Container(child: Center(child: Text("error"))));
            }
            _controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                int count = 0;
                for (int i = 0; i < snapshot.data.length; i++) {
                  if (convertInCorrect(snapshot.data[i].index) ==
                      snapshot.data[i].correctAnswer) {
                    count++;
                  }
                }
                if (check == 1) {
                  showAlertSubmit(context, count, snapshot.data.length);
                  Provider.of<CountModel>(context).complate();
                }
                check++;
              }
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    _controller.forward(from: 0.0);
                    Navigator.of(context).pop();
                  },
                ),
                title: Text("Đề thi", style: TextStyle(color: Colors.red)),
                centerTitle: true,
                actions: <Widget>[
                  (data['slug'] == "van" || snapshot.data.length == 0) ? Text(
                      "") : GestureDetector(
                    child: Container(
                      child: Center(
                          child: Text("Nộp bài",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17))),
                      margin: EdgeInsets.only(right: 20 * width),
                    ),
                    onTap: () {
                      int count = 0;
                      for (int i = 0; i < snapshot.data.length; i++) {
                        if (convertInCorrect(snapshot.data[i].index) ==
                            snapshot.data[i].correctAnswer) {
                          count++;
                        }
                      }
                      showAlertSubmit(context, count, snapshot.data.length);
                      Provider.of<CountModel>(context).complate();
                      _controller.stop();
                    },
                  )
                ],
              ),
              body: SafeArea(
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: (data['slug'] == "toan" ||
                                  data['slug'] == "ly" || data['slug'] == "hoa")
                                  ? Requests(
                                  subject: snapshot.data,
                                  lenght: snapshot.data.length)
                                  : (snapshot.data.length == 0
                                  ? Center(
                                child: Text("Chưa có dữ liệu"),
                              )
                                  : (data['slug'] == "van"
                                  ? RequestDefaultVanHocItem(
                                  subject: snapshot.data,
                                  lenght: snapshot.data.length)
                                  : RequestDefaultAdapter(
                                subject: snapshot.data,
                                lenght: snapshot.data.length,
                              )))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child:
                              footerWidget(context, snapshot.data.length))
                        ],
                      ))),
            );
          },
        ));
  }

  Widget footerWidget(BuildContext context, int lenght) => Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    if (Provider.of<CountModel>(context, listen: false).count >
                        0) {
                      Provider.of<CountModel>(context, listen: false)
                          .unIncrement();
                    }
                  }),
            )),
            Row(
              children: <Widget>[
                Icon(Icons.av_timer),
                SizedBox(width: 10),
                PomodoroTimer(
                    timeRemainingInSeconds: new IntTween(
                      begin: _controller.duration.inSeconds,
                      end: 0,
                    ).animate(_controller))
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    if (Provider
                        .of<CountModel>(context, listen: false)
                        .count <= lenght - 1) {
                      Provider.of<CountModel>(context, listen: false)
                          .increment();
                      print('Count : ${Provider
                          .of<CountModel>(context, listen: false)
                          .count}');
                    }
                  }),
            )),
          ],
        ),
      );
}
