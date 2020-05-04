import 'package:fluttertrivia/models/trivia_response.dart';
import 'package:fluttertrivia/services/repository.dart';
import 'package:fluttertrivia/services/trivia_service.dart';

class RepositoryImpl implements Repository {
  final TriviaService triviaService;

  RepositoryImpl(this.triviaService);

  @override
  Stream<List<TriviaQuestion>> fetchTriviaQuestions() {
    return Stream.fromFuture(triviaService.fetchTriviaQuestions())
        .map((response) => response.triviaQuestions);
  }
}
