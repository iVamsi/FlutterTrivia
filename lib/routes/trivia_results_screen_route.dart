import 'package:flutter/material.dart';
import 'package:fluttertrivia/models/trivia_response.dart';

class TriviaResultsScreenRoute {
  static final routeName = "TriviaResultsScreenRoute";
  final TriviaQuestion triviaQuestion;

  TriviaResultsScreenRoute({@required this.triviaQuestion});
}