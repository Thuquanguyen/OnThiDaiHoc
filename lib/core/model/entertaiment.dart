class EntertaimentResponse {
  List<Entertaiment> results;

  EntertaimentResponse({this.results});

  factory EntertaimentResponse.fromJson(Map<String, dynamic> json) {
    return EntertaimentResponse(
      results: json['results'] != null
          ? (json['results'] as List)
              .map((i) => Entertaiment.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entertaiment {
  String id;
  String content;
  String title;

  Entertaiment({this.id, this.content, this.title});

  factory Entertaiment.fromJson(Map<String, dynamic> json) {
    return Entertaiment(
      id: json['id'],
      content: json['content'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['title'] = this.title;
    return data;
  }
}