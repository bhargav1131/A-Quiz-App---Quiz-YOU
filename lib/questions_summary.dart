
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 230,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(((data['question_index'] as int) + 1).toString(), style: const TextStyle(color: Colors.white),),
                  // expanded guarantees that the child, i.e, Column can't take more width than its parent widget, that is, Row here
                  Expanded(
                    child: Column(children: [
                      Text(data['question'] as String, style: const TextStyle(color: Colors.white),),
                      const SizedBox(height: 22,),
                      Text(data['user_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 252, 1, 1)),),
                      Text(data['correct_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 5, 108, 204)),),
                    ],),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
