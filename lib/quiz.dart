import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_button.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz ({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
   List<String> selectedAnswers=[];
var activeScreen='start-screen';
 
  void switchScreen(){
    setState(() {
   activeScreen='Questions-Screen' ; 
    });
  }
  void chooseAnswers(String ans)
  {
selectedAnswers.add(ans);
if(selectedAnswers.length==questions.length)
{
  setState(() {
    activeScreen='result-screen';
  });
}
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen='Question-screen';
    });
  }
  
  @override
  Widget build(context){
    Widget screen=StartScreen(switchScreen);
    if(activeScreen=='Questions-Screen')
   { screen= QuestionsScreen(onselectAns: chooseAnswers
   ,);
   }
   if(activeScreen=='result-screen')
   {
    screen=ResultsScreen(chosenAns: selectedAnswers,restart: restartQuiz,);
   }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
            colors: [Color.fromRGBO(72, 25, 152, 1),
             Color.fromRGBO(103, 58, 183, 1)],
            begin: Alignment.topLeft,
          end: Alignment.bottomRight,
            ),
            ),
          
          child:  screen),
          ),
          );
  }
}