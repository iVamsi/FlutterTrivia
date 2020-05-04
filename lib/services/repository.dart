import 'package:fluttertrivia/models/trivia_response.dart';

abstract class Repository {
  Stream<List<TriviaQuestion>> fetchTriviaQuestions();
}