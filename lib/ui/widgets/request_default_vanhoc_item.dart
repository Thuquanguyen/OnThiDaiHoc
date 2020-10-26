import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/viewmodel/count_model.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:provider/provider.dart';

class RequestDefaultVanHocItem extends StatefulWidget {
  final List<Question> subject;
  final int lenght;

  RequestDefaultVanHocItem({@required this.subject, @required this.lenght});

  @override
  _RequestDefaultVanHocItemState createState() =>
      _RequestDefaultVanHocItemState();
}

class _RequestDefaultVanHocItemState extends State<RequestDefaultVanHocItem> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 813;
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
              Column(
                children: [
                  SizedBox(height: 10 * height),
                  Text("Đáp án".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5 * height),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Html(
                        data: widget.subject[provider.count - 1].theAnswer),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget request(int index, bool isCheck) {
    print("index = $index");
    String result = widget.subject[index].description;
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              "Câu số : ${index + 1}/${widget.lenght}",
              style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
            width: MediaQuery.of(context).size.width, child: Html(data: result))
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
