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
  String type;
  String url;

  Entertaiment({this.id, this.content, this.title, this.type, this.url});

  factory Entertaiment.fromJson(Map<String, dynamic> json) {
    return Entertaiment(
      id: json['_id'],
      content: json['content'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['content'] = this.content;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}