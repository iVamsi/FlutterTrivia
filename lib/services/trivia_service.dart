import 'dart:convert';
import 'package:fluttertrivia/models/trivia_response.dart';

import 'package:http/http.dart' show Client;

class TriviaService {
  final Client client = Client();
  final String triviaUrl = "https://opentdb.com/api.php?amount=10&type=multiple";

  Future<TriviaResponse> fetchTriviaQuestions() async {
    final response = await client.get(triviaUrl);
    print(triviaUrl);

    final json = jsonDecode(response.body);
    print(json);

    return TriviaResponse.fromJson(json);
  }
}