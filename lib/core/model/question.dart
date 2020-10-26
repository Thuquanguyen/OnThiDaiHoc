class Question {
  String id;
  List<String> answer;
  String correctAnswer;
  String description;
  List<ImageUrlQuestion> imageUrlQuestion;
  String theAnswer;
  int index;

  Question(
      {this.id, this.answer, this.correctAnswer, this.description, this.imageUrlQuestion, this.theAnswer, this.index = 0});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'],
      answer: json['answer'] != null
          ? new List<String>.from(json['answer'])
          : null,
      correctAnswer: json['correctAnswer'],
      description: json['description'],
      imageUrlQuestion: json['imageUrlQuestion'] != null
          ? (json['imageUrlQuestion'] as List).map((i) =>
          ImageUrlQuestion.fromJson(i)).toList()
          : null,
      theAnswer: json['theAnswer'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['correctAnswer'] = this.correctAnswer;
    data['description'] = this.description;
    data['theAnswer'] = this.theAnswer;
    if (this.answer != null) {
      data['answer'] = this.answer;
    }
    if (this.imageUrlQuestion != null) {
      data['imageUrlQuestion'] =
          this.imageUrlQuestion.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageUrlQuestion {
  String id;
  String url;

  ImageUrlQuestion({this.id, this.url});

  factory ImageUrlQuestion.fromJson(Map<String, dynamic> json) {
    return ImageUrlQuestion(
      id: json['id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}