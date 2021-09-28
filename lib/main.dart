import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import 'home.dart';
import 'shop.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var numberIndex = 0;
  var numberList = [
    {
      "numberQus": "Color",
      "ans": [
        {"text": "Black", "score": 10},
        {"text": "Green", "score": 15},
        {"text": "Blue", "score": 20},
        {"text": "White", "score": 12}
      ],
    },
    {
      "numberQus": "Adress",
      "ans": [
        {"text": "Mugda", "score": 5},
        {"text": "Basabo", "score": 8},
        {"text": "Maniknagor", "score": 10}
      ],
    },
    {
      "numberQus": "Number",
      "ans": [
        {"text": "1", "score": 1},
        {"text": "2", "score": 2},
        {"text": "3", "score": 3},
        {"text": "4", "score": 4}
      ],
    },
  ];

  var _totalScore = 0;

  void _reStart() {
    setState(() {
      _totalScore = 0;
      numberIndex = 0;
    });
  }

  void tapButton(int score) {
    _totalScore += score;

    setState(() {
      numberIndex = numberIndex + 1;
    });
    print("Taped the Button");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Shop(),
      home: Home(),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text("My Flutter App"),
    //   ),
    //   body: numberIndex < numberList.length
    //       ? Quiz(
    //           number: numberList,
    //           numberIndex: numberIndex,
    //           tapButton: tapButton,
    //         )
    //       : Result(_totalScore,_reStart),
    // ),
  }
}
