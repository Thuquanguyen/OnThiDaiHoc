import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/viewmodel/tuyensinh_model.dart';
import 'package:flutterappdogandcat/ui/views/favorite/tuyensinh_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_view.dart';

class FavoriteView extends StatefulWidget {
  static const routeName = "/favorite";

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final controller = TextEditingController();
  TuyenSinhModel model = TuyenSinhModel.instance;
  List<Entertaiment> list = [];
  var items = List<Entertaiment>();

  @override
  void initState() {
    model.getListEntertaiment("tuyen_sinh", "").then((value) {
      setState(() {
        list = value;
        items.addAll(value);
      });
    });
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Entertaiment> dummySearchList = List<Entertaiment>();
    dummySearchList.addAll(list);
    if (query.isNotEmpty) {
      List<Entertaiment> dummyListData = List<Entertaiment>();
      dummySearchList.forEach((item) {
        if (item.title.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(list);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder<List<Entertaiment>>(
                stream: model.entertaimentStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (snapshot.error != null) {
                    return Center(child: Text("Error"));
                  }
                  return Column(
                    children: [
                      Container(
                          child: Container(
                            child: Center(
                              child: ListTile(
                                  title: TextField(
                                    onChanged: (value) {
                                      filterSearchResults(value);
                                    },
                                    controller: controller,
                                    decoration: InputDecoration(
                                        hintText: "Đại học Bách Khoa Hà Nội",
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.cancel),
                                            onPressed: () {
                                              controller.text = "";
                                            })),
                                  ),
                                  leading: Icon(Icons.search)),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            height: 40,
                          ),
                          height: 80,
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      SizedBox(height: 20),
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: GestureDetector(
                              child: Card(
                                  child: ListTile(
                                leading: Icon(Icons.library_books),
                                title: Text(snapshot.data[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              )),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, TuyenSinhView.routeName,
                                    arguments: snapshot.data[index]);
                              },
                            )),
                        itemCount: snapshot.data.length,
                      ))
                    ],
                  );
                })));
  }
}
