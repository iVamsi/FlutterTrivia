import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertrivia/blocs/trivia_questions_list_bloc.dart';
import 'package:fluttertrivia/services/repository.dart';

import 'mocks/mock_repository.dart';

void main() {

  group("fetching questions", () {
    test("Getting questions with clearing list happy path", () {
      Repository repository = MockRepository.successWithClearingList();
      TriviaQuestionsListBloc bloc =
          TriviaQuestionsListBloc(repository: repository);

      bloc.triviaQuestionsStream.listen(expectAsync1((questions) {
        expect(questions, isNull);
        // TODO: Fix error when below line is uncommented => Bad state: Cannot add new events after calling close
        // bloc.dispose();
      }, count: 2, max: 0));

      bloc.fetchTriviaQuestions(true);
    });

    test("Getting questions without clearing list happy path", () {
      Repository repository = MockRepository.successWithoutClearingList();
      TriviaQuestionsListBloc bloc =
          TriviaQuestionsListBloc(repository: repository);

      bloc.triviaQuestionsStream.listen(expectAsync1((questions) {
        expect(questions, isNotNull);
        expect(questions, isNotEmpty);
        bloc.dispose();
      }));

      bloc.fetchTriviaQuestions(false);
    });

    test("Getting questions error path", () {
      Repository repository = MockRepository.failure();
      TriviaQuestionsListBloc bloc = TriviaQuestionsListBloc(repository: repository);

      bloc.triviaQuestionsStream
          .listen((expectAsync1((_) {}, count: 1, max: 0)),
              onError: expectAsync1((error) {
        expect(error, isNotNull);
        bloc.dispose();
      }));

      bloc.fetchTriviaQuestions(true);
    });
  });

//  test("Showing Loading spinner happy path", () {
//    Repository repository = MockRepository.successWithClearingList();
//    TriviaQuestionsListBloc bloc =
//    TriviaQuestionsListBloc(repository: repository);

//    bloc.triviaQuestionsStream.listen(expectAsync1((questions) {
//      expectLater(bloc.triviaQuestionsStream, emitsInOrder([
//        // show spinner on null stream
//        emits(null),
//        // hide spinner on non-null stream
//        emits(questions)
//      ]));
//    }, count: 2, max: 0));

//    bloc.fetchTriviaQuestions(true);
//  });
}
