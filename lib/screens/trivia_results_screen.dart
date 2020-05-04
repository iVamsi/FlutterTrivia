import 'package:flutter/material.dart';
import 'package:fluttertrivia/routes/trivia_results_screen_route.dart';
import 'package:html_unescape/html_unescape.dart';

class TriviaResultsScreen extends StatefulWidget {
  @override
  _TriviaResultsScreenState createState() => _TriviaResultsScreenState();
}

class _TriviaResultsScreenState extends State<TriviaResultsScreen> {

  @override
  Widget build(BuildContext context) {
    final TriviaResultsScreenRoute _triviaResultsScreenRoute = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trivia Question",
          style: TextStyle(
            color: Colors.white
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.green
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Question: ${HtmlUnescape().convert(_triviaResultsScreenRoute.triviaQuestion.question)}",
              style: TextStyle(
                color: Colors.deepPurple
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Answer: ${HtmlUnescape().convert(_triviaResultsScreenRoute.triviaQuestion.correctAnswer)}",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic
              ),
            ),
          )
        ],
      ),
    );
  }
}