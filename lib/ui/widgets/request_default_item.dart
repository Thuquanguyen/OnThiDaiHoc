import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/viewmodel/count_model.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:provider/provider.dart';

class RequestDefaultAdapter extends StatefulWidget {
  final List<Question> subject;
  final int lenght;

  RequestDefaultAdapter({@required this.subject, @required this.lenght});

  @override
  _RequestDefaultAdapterState createState() => _RequestDefaultAdapterState();
}

class _RequestDefaultAdapterState extends State<RequestDefaultAdapter> {
  List<bool> _list = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 628;
    final provider = Provider.of<CountModel>(context);

    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              request(provider.count - 1, provider.isCheck, width),
              SizedBox(height: 20 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[0],
                  value: "A",
                  width: width,
                  height: height,
                  index: 0,
                  indexQuestion: provider.count - 1),
              SizedBox(height: 10 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[1],
                  value: "B",
                  width: width,
                  height: height,
                  index: 1,
                  indexQuestion: provider.count - 1),
              SizedBox(height: 10 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[2],
                  value: "C",
                  width: width,
                  height: height,
                  index: 2,
                  indexQuestion: provider.count - 1),
              SizedBox(height: 10 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[3],
                  value: "D",
                  width: width,
                  height: height,
                  index: 3,
                  indexQuestion: provider.count - 1),
              Visibility(
                visible: provider.isCheck,
                child: Column(
                  children: [
                    SizedBox(height: 10 * height),
                    Text("Đáp án".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5 * height),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Html(
                          data: widget.subject[provider.count - 1].correctAnswer
                              .toUpperCase()),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget request(int index, bool isCheck, double width) {
    String result = widget.subject[index].description;
    return Card(
        child: Padding(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Html(
                data: result,
                defaultTextStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    inherit: true,
                    fontFamily: "RobotoSlab", color: colorFromHex("#000409")),
              )),
          padding: EdgeInsets.all(7 * width),
        ),
        color: colorFromHex("#F1F2F1"),
        elevation: 0);
  }

  Widget _myRadioButton({String title, String value, double width, double height, int index, int indexQuestion}) {
    return GestureDetector(
        child: Card(
          color: (index == widget.subject[indexQuestion].index) ? colorFromHex("#E8F2FD") : Colors.white,
          child: Padding(
            child: Row(
              children: <Widget>[
                Container(
                    child: Text(
                      value,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20 * width,
                          color: colorFromHex("#4581B8"),
                          fontFamily: "Sriracha"),
                    ),
                    margin: EdgeInsets.only(left: 10 * width)),
                SizedBox(width: 10 * width),
                Expanded(
                    child: Align(
                  child: Html(
                    data: title,
                    defaultTextStyle: TextStyle(fontFamily: "RobotoSlab", color: colorFromHex("#000409")),
                  ),alignment: Alignment.topLeft,
                ))
              ],
            ),
            padding: EdgeInsets.all(5),
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: colorFromHex("#E8F2FD"), width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
          setState(() {
            for (int i = 0; i < _list.length; i++) {
              _list[i] = false;
            }
            _list[index] = true;
            widget.subject[indexQuestion].index = index;
          });
        });
  }
//  widget.subject.cover_url
}
