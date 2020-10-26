import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/viewmodel/entertaiment_model.dart';
import 'package:flutterappdogandcat/ui/views/entertainment/details_entertaiment_view.dart';

class EntertaimentView extends StatefulWidget {
  static const routeName = "/entertaiment";

  @override
  _EntertaimentViewState createState() => _EntertaimentViewState();
}

class _EntertaimentViewState extends State<EntertaimentView> {
  EntertaimentModel model = EntertaimentModel.instance;

  @override
  void initState() {
    model.getListEntertaiment("giai_tri", "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Entertaiment>>(
        stream: model.entertaimentStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text("Error"));
          }
          return ListView.builder(
            itemBuilder: (context, index) =>
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      child: Card(
                          child: ListTile(
                              leading: Icon(Icons.library_books),
                              title: Text(
                                snapshot.data[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(snapshot.data[index].content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis))),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.pushNamed(
                        context, DetailsEntertaimentView.routerName,
                        arguments: snapshot.data[index]);
                  },
                    )),
            itemCount: snapshot.data.length,
          );
        });
  }
}
