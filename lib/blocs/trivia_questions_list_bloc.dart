import 'package:fluttertrivia/models/trivia_response.dart';
import 'package:fluttertrivia/services/repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class TriviaQuestionsListBloc extends Bloc {
  final _triviaQuestionsListSubject = PublishSubject<List<TriviaQuestion>>();
  Stream<List<TriviaQuestion>> get triviaQuestionsStream =>
      _triviaQuestionsListSubject.stream;
  final Repository repository;

  TriviaQuestionsListBloc({this.repository});

  void fetchTriviaQuestions(bool shouldClearList) {
    if (shouldClearList) {
      _triviaQuestionsListSubject.add(null);
    }
    repository
        .fetchTriviaQuestions()
        .listen((questions) => _triviaQuestionsListSubject.add(questions),
            onError: (error) {
      _triviaQuestionsListSubject.addError(error);
      print("fetchTriviaQuestions - $error");
    });
  }

  @override
  void dispose() {
    _triviaQuestionsListSubject.close();
  }
}
