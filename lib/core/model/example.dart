class ExampleAPI {
    List<Example> results;

    ExampleAPI({this.results});

    factory ExampleAPI.fromJson(Map<String, dynamic> json) {
        return ExampleAPI(
            results: json['results'] != null ? (json['results'] as List).map((i) => Example.fromJson(i)).toList() : null,
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

class Example {
    String id;
    String code;
    String title;
    String typeQuest;

    Example({this.id, this.code, this.title, this.typeQuest});

    factory Example.fromJson(Map<String, dynamic> json) {
        return Example(
            id: json['_id'],
            code: json['code'], 
            title: json['title'], 
            typeQuest: json['typeQuest'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.id;
        data['code'] = this.code;
        data['title'] = this.title;
        data['typeQuest'] = this.typeQuest;
        return data;
    }
}