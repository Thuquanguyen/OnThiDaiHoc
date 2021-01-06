import 'package:flutter/material.dart';

class ItemTheoryAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Công thức",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(Icons.book_outlined,color: Colors.blue),
                )
              ],
            ),)));
  }
}
