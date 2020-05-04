import 'package:flutter/material.dart';
import 'package:fluttertrivia/blocs/trivia_questions_list_bloc.dart';
import 'package:fluttertrivia/models/trivia_response.dart';
import 'package:fluttertrivia/routes/trivia_results_screen_route.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:html_unescape/html_unescape.dart';

class TriviaQuestionsListScreen extends StatefulWidget {
  @override
  _TriviaQuestionsListScreenState createState() =>
      _TriviaQuestionsListScreenState();
}

class _TriviaQuestionsListScreenState extends State<TriviaQuestionsListScreen> {
  TriviaQuestionsListBloc bloc;

  @override
  void didChangeDependencies() {
    if (bloc == null) {
      bloc = BlocProvider.of<TriviaQuestionsListBloc>(context);
      _refreshQuestions(true);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Trivia Questions List",
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.blue),
        body: StreamBuilder(
          stream: bloc.triviaQuestionsStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return _getProgressDialog();
            }
            return _getListView(snapshot.data);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.fetchTriviaQuestions(true);
          },
          child: Icon(Icons.refresh),
        ));
  }

  _getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  ListView _getListView(List<TriviaQuestion> questions) => ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int position) {
        return _getRow(questions[position]);
      });

  Widget _getRow(TriviaQuestion question) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
            TriviaResultsScreenRoute.routeName,
            arguments:
                TriviaResultsScreenRoute(triviaQuestion: question)),
        title: Text(
          "${HtmlUnescape().convert(question.question)}",
        ),
      ),
    );
  }

  void _refreshQuestions(bool shouldClearList) {
    bloc.fetchTriviaQuestions(shouldClearList);
  }
}
