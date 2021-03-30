import 'package:flutter/material.dart';

class ItemCommonPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(
      leading: Icon(Icons.book),
      title: Text("Vẽ đồ thị"),
      subtitle: Text("Khảo sát đồ thị hàm số"),
    ),);
  }
}
