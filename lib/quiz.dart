import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_scrn.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartPage(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(choosenAnswers: selectedAnswers);
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 14, 131),
                Color.fromARGB(255, 53, 39, 209),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}



/*
Note: This is another approach of lifting the state up instead of using initstate

class _QuizState extends State<Quiz>{
  var activeScreen = 'start-screen';

  void switchScreen(){
    setState((){
      activeScreen = 'questions-screen';
    })
  }

  Widget build(context){
    ......
    ..........
    ..............

    child: activeScreen = 'start-screen'
              ? StartPage(switchScreen)
              : const QuestionScreen(),
  }
}
*/