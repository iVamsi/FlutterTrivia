import 'package:fluttertrivia/services/repository.dart';
import 'package:mockito/mockito.dart';

import 'mock_responses.dart';

class MockRepository extends Mock implements Repository {
  MockRepository();

  factory MockRepository.successWithClearingList() {
    MockRepository mockRepository = MockRepository();
    when(mockRepository.fetchTriviaQuestions()).thenAnswer((_) => Stream.value(MockResponses.fetchTriviaQuestions(true)));
    return mockRepository;
  }

  factory MockRepository.successWithoutClearingList() {
    MockRepository mockRepository = MockRepository();
    when(mockRepository.fetchTriviaQuestions()).thenAnswer((_) => Stream.value(MockResponses.fetchTriviaQuestions(false)));
    return mockRepository;
  }

  factory MockRepository.failure() {
    MockRepository mockRepository = MockRepository();
    when(mockRepository.fetchTriviaQuestions()).thenAnswer((_) => Stream.error(MockResponses.failedResponseError()));
    return mockRepository;
  }
}