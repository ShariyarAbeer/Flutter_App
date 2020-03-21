import 'package:flutter/material.dart';
import './ans.dart';
import './qus.dart';



class Quiz extends StatelessWidget {
  final int numberIndex;
  final number;
  final Function tapButton;

 Quiz({this.number,this.numberIndex,this.tapButton});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Qus(number[numberIndex]["numberQus"]),
        ...(number[numberIndex]["ans"] as List<Map<String, Object>>).map((ans) {
          return Ans(() => tapButton(ans["score"]), ans["text"]);
        })
      ],
    ) ;
  }
}
