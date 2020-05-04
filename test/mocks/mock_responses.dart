import 'package:fluttertrivia/models/trivia_response.dart';

class MockResponses {
  static List<TriviaQuestion> fetchTriviaQuestions(bool shouldClearList) {
    List<TriviaQuestion> questions = [];

    if (shouldClearList) {
      return null;
    }

    questions.add(TriviaQuestion("question1", "answer1", ["incorrectAnswer1", "incorrectAnswer2"]));
    questions.add(TriviaQuestion("question2", "answer2", ["incorrectAnswer11", "incorrectAnswer22"]));
    questions.add(TriviaQuestion("question3", "answer3", ["incorrectAnswer111", "incorrectAnswer222"]));
    questions.add(TriviaQuestion("question4", "answer4", ["incorrectAnswer1111", "incorrectAnswer2222"]));

    return questions;
  }

  static Error failedResponseError() {
    return Error();
  }
}