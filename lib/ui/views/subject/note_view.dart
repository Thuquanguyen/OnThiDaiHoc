import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/note.dart';
import 'package:flutterappdogandcat/core/viewmodel/note_model.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/shared/date_time.dart';
import 'package:flutterappdogandcat/ui/views/subject/create_task_view.dart';
import 'package:flutterappdogandcat/ui/widgets/note_item.dart';

class NoteView extends StatefulWidget {
  static const routeName = "/note";

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  NoteModel model = NoteModel.instance;

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now();
    var prevMonth = new DateTime(date.year, date.month, date.day);
    var weekday = date.weekday;

    String slug = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;
    model.getListAllNote(slug);
    return Scaffold(
        backgroundColor: kLightYellow,
        appBar: AppBar(
          backgroundColor: kLightYellow,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: StreamBuilder<List<Note>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            } else if (snapshot.error != null) {
              return Center(child: Text("Error"));
            }
            return Column(
              children: <Widget>[
                header(
                    width,
                    height,
                    context,
                    snapshot.data.length > 0 ? snapshot.data[snapshot.data
                        .length - 1].id : 0,
                    slug,
                    prevMonth.day,
                    prevMonth.month,
                    prevMonth.year),
                snapshot.data.length > 0
                    ? Expanded(child: listTask(snapshot.data, slug))
                    : Center(
                    child: Text("Bạn chưa có ghi chú! Tạo ghi chú ngay"))
              ],
            );
          },
          stream: model.noteStream,
        ));
  }

  Widget header(double width, double height, BuildContext context, int id,
      String slug, int day, int month, int year) =>
      ListTile(
        title: Row(
          children: <Widget>[
            Expanded(
                child: Text("Hôm nay",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30 * width))),
            Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 40 * height,
                    width: 100 * width,
                    decoration: BoxDecoration(
                        color: kGreen,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          "Thêm",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            CreateTaskView.routeName, arguments: {
                          'data': slug,
                          'type': 0
                        });
                      },
                    ),
                  ),
                ))
          ],
        ),
        subtitle: Text("Ngày $day/$month/$year".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16 * width, fontWeight: FontWeight.bold)),
      );

  Widget listTask(List<Note> notes, String slug) =>
      ListView.builder(
          itemBuilder: (context, index) {
            return ItemNoteAdapter(noteModel: notes[index], slug: slug,);
          },
          itemCount: notes.length);
}
