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
                  return Center(child: Text("Chưa có dữ liệu!"));
                })));
  }
}
