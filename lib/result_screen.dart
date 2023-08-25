import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
class ResultsScreen extends StatelessWidget{
  ResultsScreen({super.key,required this.chosenAns});
  final List<String> chosenAns;
List<Map<String,Object>>getSummary(){
  final List<Map<String,Object>> summary=[];
  for (var i=0;i<chosenAns.length;i++){
    summary.add({
      'question_index':i,
      'questions':questions[i],
      'correct_ans':questions[i].answers[0],
    });
  }
  return summary;
  }
  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: 
    Container(
      margin: const EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [const Text('You have answered x questions correctly out of y questions'),
       const SizedBox(height: 30),
       const Text('List of questions and answers'),
        const SizedBox(height:30),
        TextButton(onPressed: (){}, child: const Text('Restart Quiz'))
        ])));
  }
}