import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:flutterappdogandcat/core/viewmodel/example_model.dart';
import 'package:flutterappdogandcat/ui/views/test/example_view.dart';
import 'package:flutterappdogandcat/ui/widgets/test_item.dart';

class ExampleListView extends StatelessWidget {
  static const routeName = '/example-list';

  ExampleModel model = ExampleModel.instance;

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    String slug = ModalRoute.of(context).settings.arguments;
    model.getListExample(slug);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Danh mục đề thi",style: TextStyle(color: Colors.black)),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: StreamBuilder<List<Example>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                child: Center(child: CupertinoActivityIndicator()));
          } else if (snapshot.error != null) {
            return Container(child: Center(child: Text("ERROR")));
          }
          return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                        child: GestureDetector(
                          child: ItemTest(snapshot.data[index],slug),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ExampleView.routeName, arguments: {
                              'slug': slug,
                              'id': snapshot.data[index].id
                            });
                          },
                        ),
                      ),
                  itemCount: snapshot.data.length));
        },
        stream: model.exampleStream,
      ),
    );
  }
}
