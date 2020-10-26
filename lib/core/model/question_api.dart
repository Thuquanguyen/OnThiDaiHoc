import 'question.dart';

class QuestionAPI {
  Results results;

  QuestionAPI({this.results});

  factory QuestionAPI.fromJson(Map<String, dynamic> json) {
    return QuestionAPI(
      results: json['results'] != null
          ? Results.fromJson(json['results'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    return data;
  }
}

class Results {
  int v;
  String id;
  String code;
  List<Question> questions;
  String typeQuest;

  Results({this.v, this.id, this.code, this.questions, this.typeQuest});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      v: json['__v'],
      id: json['_id'],
      code: json['code'],
      questions: json['questions'] != null ? (json['questions'] as List).map((
          i) => Question.fromJson(i)).toList() : null,
      typeQuest: json['typeQuest'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__v'] = this.v;
    data['_id'] = this.id;
    data['code'] = this.code;
    data['typeQuest'] = this.typeQuest;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
