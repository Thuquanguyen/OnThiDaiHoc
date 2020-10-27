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
      appBar: AppBar(
        title: Text("Danh mục đề thi"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
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
                          child: ItemTest(snapshot.data[index]),
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

  Widget char() =>
      AnimatedCircularChart(
        key: _chartKey,
        size: Size.fromRadius(30),
        initialChartData: <CircularStackEntry>[
          new CircularStackEntry(
            <CircularSegmentEntry>[
              new CircularSegmentEntry(
                33.33,
                Colors.blue,
                rankKey: 'completed',
              ),
              new CircularSegmentEntry(
                66.67,
                Colors.grey,
                rankKey: 'remaining',
              ),
            ],
            rankKey: 'progress',
          ),
        ],
        chartType: CircularChartType.Radial,
        percentageValues: true,
        holeLabel: '20%',
        labelStyle: new TextStyle(
          color: Colors.blueGrey[600],
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
      );
}
