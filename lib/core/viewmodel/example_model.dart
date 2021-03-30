import 'dart:async';
import 'package:flutterappdogandcat/core/bloc/bloc_base.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:flutterappdogandcat/core/service/api.dart';
import 'package:flutterappdogandcat/ui/shared/api_url.dart';

class ExampleModel extends BlocBase {
  ExampleModel._internal();

  static final ExampleModel _instance = ExampleModel._internal();

  static ExampleModel get instance => _instance;

  final StreamController<List<Example>> _exampleController =
      StreamController.broadcast();

  Stream<List<Example>> get exampleStream => _exampleController.stream;

  final Api exampleProvider = Api();

  Future<List<Example>> getListExample(String slug) async {
    print("API : $BASE_URL_LIST_DE_THI$slug");
    List<Example> subject =
        await exampleProvider.fetchExample("$BASE_URL_LIST_DE_THI$slug");
    if (subject == null) {
      _exampleController.sink.addError("error");
    } else {
      _exampleController.sink.add(subject);
    }
    return subject;
  }

  @override
  void dispose() {
    _exampleController.close();
  }
}
