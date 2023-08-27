import 'package:flutter/material.dart';


class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.sumarryData, {super.key});
  final List<Map<String, Object>> sumarryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: sumarryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 15, 232, 247),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               const SizedBox(width: 24),
                Expanded(
                  child:  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text((data['ques'].toString()),
                          style: const TextStyle(
                            color:  Color.fromARGB(255, 243, 245, 245),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      Text((data['user_answer'].toString()),
                          style: const TextStyle(
                            color:  Color.fromARGB(255, 247, 4, 202),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      Text((data['correct_ans'].toString()),
                          style:const TextStyle(
                            color:Color.fromARGB(255, 13, 239, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
