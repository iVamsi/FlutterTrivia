import 'package:flutter/material.dart';
import 'package:fluttertrivia/models/trivia_response.dart';
import 'package:fluttertrivia/routes/trivia_results_screen_route.dart';
import 'package:fluttertrivia/services/trivia_service.dart';
import 'package:html_unescape/html_unescape.dart';

class TriviaQuestionsListScreen extends StatefulWidget {
  @override
  _TriviaQuestionsListScreenState createState() =>
      _TriviaQuestionsListScreenState();
}

class _TriviaQuestionsListScreenState extends State<TriviaQuestionsListScreen> {
  final questions = <TriviaQuestion>[];

  @override
  void initState() {
    _refreshQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Trivia Questions List",
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.blue),
        body: _getBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: _refreshQuestions,
          child: Icon(Icons.refresh),
        ));
  }

  _getBody() {
    if (_showLoadingDialog()) {
      return _getProgressDialog();
    } else {
      return _getListView();
    }
  }

  _showLoadingDialog() {
    return questions.length == 0;
  }

  _getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  ListView _getListView() => ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int position) {
        return _getRow(position);
      });

  Widget _getRow(int position) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
            TriviaResultsScreenRoute.routeName,
            arguments:
                TriviaResultsScreenRoute(triviaQuestion: questions[position])),
        title: Text(
          "${HtmlUnescape().convert(questions[position].question)}",
        ),
      ),
    );
  }

  void _fetchTriviaQuestions() async {
    final TriviaResponse triviaResponse =
        await TriviaService().fetchTriviaQuestions();
    setState(() {
      questions.addAll(triviaResponse.triviaQuestions);
    });
  }

  void _refreshQuestions() async {
    setState(() {
      questions.clear();
      _fetchTriviaQuestions();
    });
  }
}
