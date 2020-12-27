import 'package:flutter/material.dart';

class ItemResult extends StatelessWidget {
  final int index;

  const ItemResult({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 628;

    return Container(
      child: Card(
        child: Column(
          children: [
            Icon(index % 2 == 0 ? Icons.cancel : Icons.check_circle,
                color: index % 2 == 0 ? Colors.red : Colors.blue),
            SizedBox(height: 10 * height),
            Text("Câu $index")
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        elevation: 10,
      ),
      margin: EdgeInsets.all(5),
    );
  }
}
