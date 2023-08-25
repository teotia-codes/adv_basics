import 'package:flutter/material.dart';
class QuestionSummary extends StatelessWidget{
 const QuestionSummary(this.sumarryData,{super.key});
 final List<Map<String,Object>> sumarryData;
  @override
  Widget build(context){
    return Column(children: sumarryData.map((data)
    {return Row(children: [
      Text(((data['questions']as int)+1).toString())
    ],);

    }).toList(),
    );

  }
}
//comment