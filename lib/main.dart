import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/router.dart';
import 'package:flutterappdogandcat/ui/views/admissions/admissions_view.dart';
import 'package:flutterappdogandcat/ui/views/admod/admod_view.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/exam_years.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/list_code_exam.dart';
import 'package:flutterappdogandcat/ui/views/splat_view.dart';
import 'package:flutterappdogandcat/ui/views/start-exam/start_exam_widget.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/web_example_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/theory_view.dart';
import 'package:flutterappdogandcat/ui/views/test/example_list_view.dart';
import 'core/bloc/bloc_provider.dart';
import 'core/viewmodel/question_model.dart';
import 'ui/views/subject/create_task_view.dart';
import 'ui/views/subject/note_view.dart';
import 'ui/views/subject/remember/remember_view.dart';
import 'ui/views/subject/subject_view.dart';
import 'ui/views/test/example_view.dart';

main() => runApp(DACApp());

class DACApp extends StatelessWidget {
  QuestionModel _bloc = QuestionModel.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          initialRoute: SplatView.routeName,
          onGenerateRoute: Routerr.generateRoute,
          routes: {
            NoteView.routeName: (_) => NoteView(),
            SubjectView.routeName: (_) => SubjectView(),
            StartExamWidget.routerName: (_) => StartExamWidget(),
            ExampleView.routeName: (_) => ExampleView(),
            RememberView.routeName: (_) => RememberView(),
            CreateTaskView.routeName: (_) => CreateTaskView(),
            ExampleListView.routeName: (_) => ExampleListView(),
            TheoryView.routeName: (_) => TheoryView(),
            ExamYears.routeName: (_) => ExamYears(),
            WebExampleView.routeName: (_) => WebExampleView(),
            ListCodeExam.routeName : (_) => ListCodeExam(),
            AdmissionsView.routeName: (_) => AdmissionsView(),
            AdmodView.routeName: (_) => AdmodView(),
          },
        ),
        bloc: _bloc);
  }
}
