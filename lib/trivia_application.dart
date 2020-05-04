import 'package:flutter/material.dart';
import 'package:fluttertrivia/blocs/trivia_questions_list_bloc.dart';
import 'package:fluttertrivia/routes/trivia_questions_screen_route.dart';
import 'package:fluttertrivia/routes/trivia_results_screen_route.dart';
import 'package:fluttertrivia/screens/trivia_questions_list_screen.dart';
import 'package:fluttertrivia/screens/trivia_results_screen.dart';
import 'package:fluttertrivia/services/repository_impl.dart';
import 'package:fluttertrivia/services/trivia_service.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class TriviaApplication extends StatelessWidget {

  final TriviaQuestionsListBloc _triviaQuestionsListBloc = TriviaQuestionsListBloc(
      repository: RepositoryImpl(
          TriviaService()
      )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trivia Application",
      initialRoute: TriviaQuestionsListRoute.routeName,
      routes: {
        TriviaQuestionsListRoute.routeName : (context) => BlocProvider(
          child: TriviaQuestionsListScreen(),
          bloc: _triviaQuestionsListBloc
        ),
        TriviaResultsScreenRoute.routeName : (context) => TriviaResultsScreen()
      },
    );
  }
}
