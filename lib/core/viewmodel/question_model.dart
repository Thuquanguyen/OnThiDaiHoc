import 'dart:async';
import 'package:flutterappdogandcat/core/bloc/bloc_base.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/service/api.dart';
import 'package:flutterappdogandcat/ui/shared/api_url.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class QuestionModel extends BlocBase {
  QuestionModel._internal();

  static final QuestionModel _instance = QuestionModel._internal();

  static QuestionModel get instance => _instance;

  final StreamController<List<Question>> _streamController =
      StreamController.broadcast();

  Stream<List<Question>> get subjectStream => _streamController.stream;

  final Api subjectProvider = Api();

  Future<List<Question>> getListSubject(String slug, String id) async {
    List<Question> subject =
        await subjectProvider.findSubjectByLocation("${getSlug(slug)}$id");
    print("data : ${subject}");
    if (subject == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(subject);
    }
    return subject;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
