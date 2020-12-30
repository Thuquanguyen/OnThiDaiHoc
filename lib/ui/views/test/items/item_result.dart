import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class ItemResult extends StatelessWidget {
  final int index;
  final List<Question> data;

  const ItemResult({Key key, this.index, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 628;

    return Container(
      child: Card(
        child: Column(
          children: [

            Icon(convertInCorrect(data[index].index) ==
                data[index].correctAnswer ? Icons.check_circle : Icons.cancel,
                color: convertInCorrect(data[index].index) !=
                    data[index].correctAnswer ? Colors.red : Colors.blue,size: 20,),
            SizedBox(height: 2 * height),
            Text(convertInCorrect(data[index].index).toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 2 * height),
            Text("Câu ${index + 1}")
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        elevation: 10,
      ),
      margin: EdgeInsets.all(5),
    );
  }
}
