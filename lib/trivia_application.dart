import 'package:flutter/material.dart';
import 'package:fluttertrivia/routes/trivia_questions_screen_route.dart';
import 'package:fluttertrivia/routes/trivia_results_screen_route.dart';
import 'package:fluttertrivia/screens/trivia_questions_list_screen.dart';
import 'package:fluttertrivia/screens/trivia_results_screen.dart';

class TriviaApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trivia Application",
      initialRoute: TriviaQuestionsListRoute.routeName,
      routes: {
        TriviaQuestionsListRoute.routeName : (context) => TriviaQuestionsListScreen(),
        TriviaResultsScreenRoute.routeName : (context) => TriviaResultsScreen()
      },
    );
  }
}
