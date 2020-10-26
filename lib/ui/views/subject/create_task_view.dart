import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/note.dart';
import 'package:flutterappdogandcat/core/viewmodel/note_model.dart';
import 'package:flutterappdogandcat/ui/shared/app_colors.dart';
import 'package:flutterappdogandcat/ui/widgets/custom_textfield.dart';
import 'package:flutterappdogandcat/ui/widgets/top_container.dart';

class CreateTaskView extends StatelessWidget {
  static const routeName = "/create-note";
  NoteModel model = NoteModel.instance;
  Note note;
  final controllerTitle = TextEditingController();
  final controllerContent = TextEditingController();

  List<int> arrColor = [
    0xFFFFF9EC,
    0xFFFFE4C7,
    0xFFF9BE7C,
    0xFFFED4D6,
    0xFFE46472,
    0xFFD5E4FE,
    0xFF6488E4,
    0xFFD9E6DC,
    0xFF309397
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;
    var date = new DateTime.now();
    var prevMonth = new DateTime(date.year, date.month, date.day);
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    String slug = "toan";
    Note note;
    if (data['type'] == 1) {
      note = data['data'];
      controllerTitle.text = note.title;
      controllerContent.text = note.content;
    } else {
      slug = data['data'];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkYellow,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      floatingActionButton: Container(
          child: IconButton(
              icon: Icon(Icons.check_circle, color: Colors.green, size: 50),
              onPressed: () {
                if (controllerTitle.text
                    .trim()
                    .isEmpty) {
                } else {
                  if (data['type'] == 0) {
                    note = Note(
                        slug: slug,
                        title: controllerTitle.text.trim(),
                        content: controllerContent.text.trim(),
                        color: (arrColor..shuffle()).first,
                        createAt: "${DateTime.now()}");
                    print("title : ${note.title} \n content: ${note.content}");
                    model
                        .addNote(note)
                        .then((value) => Navigator.of(context).pop());
                  } else {
                    note = Note(
                        id: note.id,
                        slug: note.slug,
                        title: controllerTitle.text.trim(),
                        content: controllerContent.text.trim(),
                        color: note.color,
                        createAt: note.createAt);
                    print("SLUG : ${note.color}");
                    model
                        .updateNote(note)
                        .then((value) => Navigator.of(context).pop());
                  }
                }
              }),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
      body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: <Widget>[
                  TopContainer(
                    padding: EdgeInsets.fromLTRB(
                        20 * width, 20 * width, 20 * width, 20 * width),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Tạo ghi chú mới',
                              style: TextStyle(
                                  fontSize: 30.0 * width,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(height: 20 * height),
                        Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyTextField(
                                  label: 'Tiêu đề',
                              controller: controllerTitle,
                            ),
                                SizedBox(height: 20 * height),
                                Text(
                                    "Ngày tạo : ${prevMonth.day}/${prevMonth
                                        .month}/${prevMonth.year}")
                              ],
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        child: MyTextField(
                          controller: controllerContent,
                          label: 'Nội dung',
                          minLines: 10,
                          maxLines: 10,
                        ),
                        margin: EdgeInsets.all(20 * width),
                      )),
                ],
              ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height)),
    );
  }
}
