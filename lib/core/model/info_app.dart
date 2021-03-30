class InfoApp {
  Results results;

  InfoApp({this.results});

  factory InfoApp.fromJson(Map<String, dynamic> json) {
    return InfoApp(
      results:
          json['results'] != null ? Results.fromJson(json['results']) : null,
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
  int dualDate;
  String id;
  String version;

  Results({this.dualDate, this.id, this.version});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      dualDate: json['dualDate'],
      id: json['id'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dualDate'] = this.dualDate;
    data['id'] = this.id;
    data['version'] = this.version;
    return data;
  }
}
