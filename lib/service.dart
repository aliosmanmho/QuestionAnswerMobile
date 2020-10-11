import 'package:http/http.dart' as http;
import 'dart:convert';
import 'entities/Question.dart';

Future<List<Question>> fetchQustion(String query) async {
  final response = await http.post(
    'https://questionwebapi.herokuapp.com/QuestionAnswer/GetAnswer',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'query': query,
    }),
  );

  if (response.statusCode == 200) {
    if (response.body.isEmpty || response.body == "[]") {
      List<Question> result = new List(1);
      result[0] = new Question(query: "Not Result", answer: "Not Result");
      return result;
    } else {
      var rb = response.body;
      var list = json.decode(rb) as List;
      List<Question> questions = list.map((i) => Question.fromJson(i)).toList();

      return questions;
    }
  } else {
    throw Exception('Failed to load album');
  }
}
