class Question {
  final String query;
  final String answer;

  Question({this.query, this.answer});

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        query: json['query'],
        answer: json['answer'],
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "answer": answer,
      };
}
