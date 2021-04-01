import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/viewmodel/remember_model.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_view.dart';

class RememberListView extends StatefulWidget {
  static const routeName = "/remember-list";

  @override
  _RememberListViewState createState() => _RememberListViewState();
}

class _RememberListViewState extends State<RememberListView> {
  RememberModel model = RememberModel.instance;

  @override
  Widget build(BuildContext context) {
    String slug = ModalRoute.of(context).settings.arguments;
    model.getListEntertaiment("kien_thuc_can_nho", slug);

    return Scaffold(
      appBar: AppBar(
        title: Text("Các kiến thức cần nhớ"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: StreamBuilder<List<Entertaiment>>(
          stream: model.entertaimentStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            } else if (snapshot.error != null) {
              return Center(child: Text("Error"));
            }
            return ListView.builder(
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: GestureDetector(
                    child: Card(
                        child: ListTile(
                          leading: Icon(Icons.library_books),
                          title: Text(snapshot.data[index].content,
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, RememberView.routeName,
                          arguments: snapshot.data[index]);
                    },
                  )),
              itemCount: snapshot.data.length,
            );
          }),
    );
  }
}