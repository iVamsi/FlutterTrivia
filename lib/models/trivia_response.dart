class TriviaResponse {
  final List<TriviaQuestion> triviaQuestions;

  TriviaResponse.fromJson(Map<String, dynamic> parsedJson)
      : triviaQuestions = (parsedJson["results"] as List)
            .map((item) => TriviaQuestion.fromJson(item))
            .toList();
}

class TriviaQuestion {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;


  TriviaQuestion(this.question, this.correctAnswer, this.incorrectAnswers);

  TriviaQuestion.fromJson(Map<String, dynamic> parsedJson)
      : question = parsedJson["question"],
        correctAnswer = parsedJson["correct_answer"],
        incorrectAnswers = (parsedJson["incorrect_answers"] as List).map((incorrectAnswer) => incorrectAnswer.toString()).toList();
}
