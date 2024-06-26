import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  // to keep track of selected answers
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // horizontal axis
          children: [
            // Text(
            //   currentQuestion.text,
            //   style: const TextStyle(color: Colors.white, fontSize: 18),
            //   textAlign: TextAlign.center,
            // ),
            Text(
              currentQuestion.text,
              // adding fonts
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),

            // follow note section
            ...currentQuestion.getShuffledAnswers().map((ans) {
              return AnswerButton(
                answerText: ans,
                // onTap: answerQuestion,
                onTap: (){
                  answerQuestion(ans);
                },
              );
            })

            // AnswerButton(answerText: currQuestion.ans[0], onTap: () {}),
            // AnswerButton(answerText: currQuestion.ans[1], onTap: () {}),
            // AnswerButton(answerText: currQuestion.ans[2], onTap: () {}),
            // AnswerButton(answerText: currQuestion.ans[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}



/*
NOTE:
The problem here is that, we have to add answerButton everytime manually according to the number of answers we have. 
So instead following this cubersome approach, we'll have a list of answers and a method that will create as many answer button as answers.

map(): does not change the original list
shuffle(): changes the original list

Here the '...' is the spread operator which is used for spreading values of list, so that we can store them in another list
 */