import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/viewmodel/tuyensinh_model.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_view.dart';

import 'items/item_admissions.dart';

class AdmissionsView extends StatefulWidget {
  static const routeName = "/favorite";

  @override
  _AdmissionsViewState createState() => _AdmissionsViewState();
}

class _AdmissionsViewState extends State<AdmissionsView> with SingleTickerProviderStateMixin{

  static final GlobalKey<ScaffoldState> scaffoldKey =
  new GlobalKey<ScaffoldState>();
  final controller = TextEditingController();
  bool _isSearching = false;
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
    final width = MediaQuery.of(context).size.width / 360;
    final height = MediaQuery.of(context).size.height / 640;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tra cứu tuyển sinh",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
            body: StreamBuilder<List<Entertaiment>>(
                stream: model.entertaimentStream,
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Center(child: CupertinoActivityIndicator());
                  // } else if (snapshot.error != null) {
                  //   return Center(child: Text("Error"));
                  // }
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
                                            icon: Icon(Icons.cancel,
                                                color: Colors.black26),
                                            onPressed: () {
                                              controller.text = "";
                                            })),
                                  ),
                                  leading: Icon(Icons.search)),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10 * width)),
                                border: Border.all(
                                  color: colorFromHex("9B9B9B"),
                                ),
                                color: Colors.white),
                          ),
                          height: 60 * height,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10 * width, horizontal: 10 * height)),
                      SizedBox(height: 5 * height),
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5 * width, horizontal: 5 * width),
                            child: ItemAdmission()),
                        itemCount: 20,
                      ))
                      //
                      // Expanded(
                      //     child: ListView.builder(
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) => Container(
                      //       margin: EdgeInsets.symmetric(
                      //           vertical: 5, horizontal: 5),
                      //       child: GestureDetector(
                      //         child: Card(
                      //             child: ListTile(
                      //           leading: Icon(Icons.library_books),
                      //           title: Text(snapshot.data[index].title,
                      //               maxLines: 2,
                      //               overflow: TextOverflow.ellipsis),
                      //         )),
                      //         onTap: () {
                      //           Navigator.pushNamed(
                      //               context, TuyenSinhView.routeName,
                      //               arguments: snapshot.data[index]);
                      //         },
                      //       )),
                      //   itemCount: snapshot.data.length,
                      // ))
                    ],
                  );
                })));
  }
}
