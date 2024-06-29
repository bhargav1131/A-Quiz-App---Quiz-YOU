import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  // const ResultsScreen({super.key, required this.choosenAnswers, required this.onRestart});
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });
  final void Function() onRestart;
  // final VoidCallback switchScreen;

  List <Map<String, Object>> getSummaryData(){
    final List <Map<String, Object>> summary = [];

    for(var i=0; i < choosenAnswers.length; i++ ){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].ans[0],
        'user_answer' : choosenAnswers[i]
      });
    }
    return summary;
  }

  final List<String> choosenAnswers;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
  
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numCorrectQuestions questions correctly!', style: const TextStyle(color: Colors.white),),
            const SizedBox(
              height: 22,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 22,
            ),
            TextButton.icon(onPressed: onRestart, style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ), icon: const Icon(Icons.restart_alt) ,label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
