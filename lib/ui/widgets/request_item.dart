import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/viewmodel/count_model.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
// import 'package:math_tex/math_tex.dart';
import 'package:provider/provider.dart';

class Requests extends StatefulWidget {
  final List<Question> subject;
  final int lenght;

  Requests({@required this.subject, @required this.lenght});

  @override
  _RequestAdapterState createState() => _RequestAdapterState();
}

class _RequestAdapterState extends State<Requests> {
  List<bool> _list = [true, false, false, false];

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
              request(provider.count - 1, provider.isCheck),
              SizedBox(height: 20 * height),
              Divider(height: 2, color: Colors.tealAccent),
              SizedBox(height: 10 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[0],
                  value: "A",
                  width: width,
                  height: height,
                  index: 0,
                  indexQuestion: provider.count - 1),
              SizedBox(height: 10 * height),
              Divider(height: 2, color: Colors.tealAccent),
              SizedBox(height: 10 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[1],
                  value: "B",
                  width: width,
                  height: height,
                  index: 1,
                  indexQuestion: provider.count - 1),
              SizedBox(height: 10 * height),
              Divider(height: 2, color: Colors.tealAccent),
              SizedBox(height: 10 * height),
              _myRadioButton(
                  title: widget.subject[provider.count - 1].answer[2],
                  value: "C",
                  width: width,
                  height: height,
                  index: 2,
                  indexQuestion: provider.count - 1),
              SizedBox(height: 10 * height),
              Divider(height: 2, color: Colors.tealAccent),
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
                      child: buildText(
                          "${widget.subject[provider.count - 1].correctAnswer.toUpperCase()} : ${widget.subject[provider.count - 1].theAnswer}"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget request(int index, bool isCheck) {
    String result = widget.subject[index].description;
    return Wrap(
      children: <Widget>[
        SizedBox(
            width: MediaQuery.of(context).size.width, child: buildText(result)),
        Center(child: widget.subject[index].imageUrlQuestion.length != 0
            ? Image.network(widget.subject[index].imageUrlQuestion[0].url)
            : Text(""),)
      ],
      crossAxisAlignment: WrapCrossAlignment.center,
    );
  }

  Widget _myRadioButton(
      {String title, String value, double width, double height, int index, int indexQuestion}) {
    return GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Center(
                    child: Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20 * width),
                )),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Provider
                    .of<CountModel>(context)
                    .isCheck ? (index ==
                    convertCorrect(widget.subject[indexQuestion].correctAnswer))
                    ? Colors.green
                    : Colors.tealAccent : Colors.tealAccent),
                width: 50 * width,
                height: 50 * height),
            SizedBox(width: 20 * width),
            Expanded(
                child: GestureDetector(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          buildText(title),
                        ],
                      )),
                  onTap: () {
                    setState(() {
                      for (int i = 0; i < _list.length; i++) {
                        _list[i] = false;
                      }
                      _list[index] = true;
                      widget.subject[indexQuestion].index = index;
                    });
                  },
                )),
            (index == widget.subject[indexQuestion].index)
                ? Icon(Icons.check_circle, color: Colors.green)
                : Text("")
          ],
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
  Widget buildText(String text) {
    return SizedBox(
      child: TeXView(child: TeXViewDocument(r"""When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$""",
          style: TeXViewStyle.fromCSS(
              'padding: 15px; color: white; background: green')),),
      height: 55,
    );
  }
}
  