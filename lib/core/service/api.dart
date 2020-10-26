import 'dart:convert';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/model/example.dart';
import 'package:flutterappdogandcat/core/model/info_app.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/model/question_api.dart';
import 'package:flutterappdogandcat/ui/shared/api_url.dart';
import 'package:http/http.dart';

class Api {
  var client = Client();

  Future<List<Question>> findSubjectByLocation(String location) async {
    var response;
    try {
      response = await client.get(location);
    } on Exception {
      print("client exceltion");
      return null;
    }
    if (response.statusCode == 200) {
      QuestionAPI subjectFromAPI;
      List<Question> items = [];
      try {
        subjectFromAPI = QuestionAPI.fromJson(json.decode(response.body));
        subjectFromAPI.results.questions.forEach((subject) {
          items.add(subject);
        });
      } on FormatException {
        print("json format exception");
      }
      return items;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }

  Future<InfoApp> getversionApp() async {
    var response;
    try {
      response = await client
          .get("https://studen-graduation.herokuapp.com/version/api/version");
    } on Exception {
      print("client exceltion");
      return null;
    }
    if (response.statusCode == 200) {
      InfoApp subjectFromAPI;
      try {
        subjectFromAPI = InfoApp.fromJson(json.decode(response.body));
      } on FormatException {
        print("json format exception");
      }
      return subjectFromAPI;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }

  Future<List<Example>> fetchExample(String location) async {
    var response;
    try {
      response = await client.get(location);
    } on Exception {
      print("client exceltion");
      return null;
    }
    if (response.statusCode == 200) {
      ExampleAPI exampleFromAPI;
      List<Example> items = [];
      try {
        exampleFromAPI = ExampleAPI.fromJson(json.decode(response.body));
        exampleFromAPI.results.forEach((subject) {
          items.add(subject);
        });
      } on FormatException {
        print("json format exception");
      }
      return items;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }

  Future<List<Entertaiment>> fetchListEntertaiment() async {
    var response;
    try {
      response = await client.get(BASE_URL_LIST_ENTERTAIMENT);
    } on Exception {
      print("client exceltion");
      return null;
    }
    if (response.statusCode == 200) {
      EntertaimentResponse exampleFromAPI;
      List<Entertaiment> items = [];
      try {
        exampleFromAPI =
            EntertaimentResponse.fromJson(json.decode(response.body));
        exampleFromAPI.results.forEach((subject) {
          items.add(subject);
        });
      } on FormatException {
        print("json format exception");
      }
      return items;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }
}
