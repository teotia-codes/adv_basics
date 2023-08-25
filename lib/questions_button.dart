import 'package:adv_basics/data/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,required this.onselectAns});
 final void Function(String ans) onselectAns;
  @override
  State<QuestionsScreen> createState(){
return _QuestionsScreen();
  }
}
class _QuestionsScreen extends State <QuestionsScreen>{
  var currentquestionIndex=0;
 void answerQuestion (String ans){
  widget.onselectAns(ans);
  
  setState(() {
  currentquestionIndex=currentquestionIndex+1;
 });
 }
  @override
  Widget build(context){
     final currQues=questions[currentquestionIndex];
    return SizedBox(
      width: double.infinity,
      child: 
    Container(
      margin: const EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Text(currQues.text,
        style: GoogleFonts.lato(color:const Color.fromARGB(255, 202, 151, 236),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center ),
        const SizedBox(height: 30,),
        ...currQues.getShuffledAnswers().map((answer){
          return AnswerButton(answerText: answer, onTap: (){
            answerQuestion(answer);
          });
        })
      ],),
    ),
    );
  }
}