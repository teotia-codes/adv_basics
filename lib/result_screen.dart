import 'package:adv_basics/questions_sumarry.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAns, required this.restart});
  final List<String> chosenAns;
  final void Function() restart;
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'ques': questions[i].text,
        'correct_ans': questions[i].answers[0],
        'user_answer': chosenAns[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final tques = questions.length;
    final ncques = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_ans'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 30),
            Text(
              'You have answered $ncques questions correctly out of $tques questions',
              style: const TextStyle(
                color: Color.fromARGB(255, 241, 239, 239),
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 125,
                ),
                OutlinedButton(
                  onPressed: restart,
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
